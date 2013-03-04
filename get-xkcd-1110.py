#!/usr/bin/env python

# get-xkcd-1110: fetch component images of xkcd comic 1110 and assemble
# Copyright (C) 2012  Lebbeous Fogle-Weekley
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import os
import sys
import optparse
import urllib2
from PIL import Image


TILESIZE = 2048
REDUCE_TO = 512
TILES_MAP = {
    "n": 14,
    "e": 48,
    "s": 25,
    "w": 33
}
TILES = (TILES_MAP["n"], TILES_MAP["e"], TILES_MAP["s"], TILES_MAP["w"]);

def options():
    parser = optparse.OptionParser()
    parser.add_option(
        "-n", action="store_true",
        help="don't assemble big image", default=False
    )
    parser.add_option(
        "-o", action="store_true",
        help="re-fetch and overwrite existing files", default=False
    )

    return parser.parse_args()

def update_image(big, new, where):
    lat, latdir, lon, londir = where

    center = (TILES[3] * REDUCE_TO, TILES[0] * REDUCE_TO)
    if latdir == "n":
        y = -lat
    else:
        y = lat - 1
    if londir == "w":
        x = -lon
    else:
        x = lon - 1

    new = new.copy().resize((REDUCE_TO, REDUCE_TO))
    new_w, new_h = new.size

    place = (new_w * x, new_h * y)

    big.paste(new, (place[0] + center[0], place[1] + center[1]))

def retrieve_images(opts, args):
    latdirs = ("n", "s")
    londirs = ("e", "w")
    failures_in_a_row = 0

    if not opts.n:
        big_image = Image.new(
            "1", (
                (TILES[1] + TILES[3]) * REDUCE_TO,
                (TILES[0] + TILES[2]) * REDUCE_TO
            )
        )
        big_image_filename = "bigimage.jpg"
        big_image_f = open(big_image_filename, "wb")

    for latdir in latdirs:
        for londir in londirs:
            for lat in range(1, TILES_MAP[latdir]):
                for lon in range(1, TILES_MAP[londir]):
                    where = (lat, latdir, lon, londir)
                    filename = "%d%s%d%s.png" % where
                    print filename,
                    if not opts.o and os.access(filename, os.F_OK):
                        try:
                            new_image = Image.open(filename)
                            print " cached ok"
                        except IOError:
                            print " cached blank"
                            continue
                    else:
                        url = "http://imgs.xkcd.com/clickdrag/" + filename
                        try:
                            r = urllib2.urlopen(urllib2.Request(url))
                            print " ok"
                        except:
                            tmp = open(filename, "wb")  # cache
                            tmp.close()
                            print " blank"
                            continue
                        f = open(filename, "wb")
                        f.write(r.read())
                        f.close()
                        new_image = Image.open(filename)
                    if not opts.n:
                        update_image(big_image, new_image, where)

    if not opts.n:
        print "writing %s" % big_image_filename
        big_image.save(big_image_f)

if __name__ == "__main__":
    if not os.access(os.getcwd(), os.W_OK):
        print "Can't write to current directory."
        print "Run from where you can write to."
        exit()

    retrieve_images(*options())
