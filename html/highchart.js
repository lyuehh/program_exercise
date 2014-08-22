$(function () {
    var data = [[{"name":"lg-miui-op-dev02.bj","data":[5.37324]},{"name":"lg-miui-mibi-stag00.bj","data":[4.88323]},{"name":"hh-miui-cash-vm-zmd0.bj","data":[3.74213]},{"name":"hh-miui-cash-vm2004.bj","data":[3.48015]},{"name":"hh-miui-cash-vm2012.bj","data":[2.86783]},{"name":"hh-miui-cash-bank01.bj","data":[2.65435]},{"name":"hh-miui-cash-bank00.bj","data":[2.62874]},{"name":"hh-miui-cash-vm2010.bj","data":[2.47572]},{"name":"zc-miui-cash-sb-nginx00.bj","data":[2.0253]},{"name":"zc-miui-cash-stag06.bj","data":[1.9126]}],[{"name":"hh-miui-cash-vm2002.bj","data":[1.74547]},{"name":"hh-miui-cash-vm2007.bj","data":[1.71581]},{"name":"hh-miui-cash-vm2001.bj","data":[1.64907]},{"name":"hh-miui-cash-vm2013.bj","data":[1.61563]},{"name":"hh-miui-cash-vm2005.bj","data":[1.58857]},{"name":"zc-miui-cash-stag00.bj","data":[1.57314]},{"name":"hh-miui-cash-vm2000.bj","data":[1.52704]},{"name":"hh-miui-cash-vm2006.bj","data":[1.4886]},{"name":"zc-miui-cash-stag04.bj","data":[1.46874]},{"name":"hh-miui-cash-cmf00.bj","data":[1.45048]}],[{"name":"hh-miui-cash-cs00.bj","data":[1.44975]},{"name":"hh-miui-cash-vm2009.bj","data":[1.44556]},{"name":"hh-miui-cash-vm2011.bj","data":[1.29256]},{"name":"hh-miui-cash-vm2003.bj","data":[1.16946]},{"name":"hh-miui-cash-cmf02.bj","data":[1.14018]},{"name":"hh-miui-cash-vm-mxy0.bj","data":[1.12792]},{"name":"lg-miui-cash-rms01.bj","data":[1.11943]},{"name":"lg-miui-cash-test01.bj","data":[1.11278]},{"name":"hh-miui-cash-cs03.bj","data":[1.06878]},{"name":"hh-miui-cash-cmf03.bj","data":[1.05515]}],[{"name":"hh-miui-cash-test01.bj","data":[1.03181]},{"name":"lg-miui-cash-pe00.bj","data":[1.0149]},{"name":"hh-miui-cash-pe03.bj","data":[1.0101]},{"name":"hh-miui-cash-vm2008.bj","data":[1.00599]},{"name":"zc-miui-cash-stag01.bj","data":[0.994553]},{"name":"lg-miui-cash-test00.bj","data":[0.95647]},{"name":"lg-miui-cash-app01.bj","data":[0.95525]},{"name":"hh-miui-cash-counter01.bj","data":[0.91938]},{"name":"hh-miui-cash-cache01.bj","data":[0.907607]},{"name":"zc-miui-cash-stag03.bj","data":[0.881373]}],[{"name":"lg-miui-cash-vm1001.bj","data":[0.881103]},{"name":"lg-miui-cash-cmf02.bj","data":[0.87947]},{"name":"zc-miui-cash-stag12.bj","data":[0.835583]},{"name":"lg-miui-cash-counter00.bj","data":[0.83277]},{"name":"hh-miui-cash-pe02.bj","data":[0.797153]},{"name":"lg-miui-cash-cmf03.bj","data":[0.792233]},{"name":"hh-miui-cash-pe00.bj","data":[0.79066]},{"name":"hh-miui-cash-cs01.bj","data":[0.75201]},{"name":"hh-miui-cash-rms01.bj","data":[0.747837]},{"name":"hh-miui-cash-cs02.bj","data":[0.747773]}],[{"name":"lg-miui-cash-bank00.bj","data":[0.745783]},{"name":"hh-miui-cash-mq00.bj","data":[0.74452]},{"name":"hh-miui-cash-cache00.bj","data":[0.718727]},{"name":"lg-miui-cash-vm1000.bj","data":[0.712053]},{"name":"hh-miui-cash-counter00.bj","data":[0.705777]},{"name":"lg-miui-cash-mq00.bj","data":[0.705253]},{"name":"hh-miui-cash-pe01.bj","data":[0.682183]},{"name":"hh-miui-cash-cmf01.bj","data":[0.677817]},{"name":"hh-miui-cash-rms00.bj","data":[0.668]},{"name":"zc-miui-cash-stag10.bj","data":[0.667563]}],[{"name":"hh-miui-l7-cash00.bj","data":[0.662217]},{"name":"lg-miui-cash-counter01.bj","data":[0.659287]},{"name":"lg-miui-cash-pe03.bj","data":[0.658323]},{"name":"hh-miui-cash-nginx00.bj","data":[0.656163]},{"name":"lg-miui-cash-pe01.bj","data":[0.6546]},{"name":"lg-miui-cash-bank01.bj","data":[0.65393]},{"name":"lg-miui-cash-cmf00.bj","data":[0.640257]},{"name":"lg-miui-cash-rms00.bj","data":[0.63448]},{"name":"lg-miui-cash-cs03.bj","data":[0.626967]},{"name":"zc-miui-cash-stag-nginx01.bj","data":[0.60884]}],[{"name":"zc-miui-cash-stag13.bj","data":[0.608827]},{"name":"hh-miui-cash-mq01.bj","data":[0.60651]},{"name":"zc-miui-cash-stag11.bj","data":[0.59221]},{"name":"lg-miui-cash-pe02.bj","data":[0.590077]},{"name":"hh-miui-mibi-qatest01.bj","data":[0.5898]},{"name":"hh-miui-cash-test02.bj","data":[0.581707]},{"name":"lg-miui-cash-cmf01.bj","data":[0.57656]},{"name":"hh-miui-cash-lvs01.bj","data":[0.572407]},{"name":"lg-miui-cash-admin00.bj","data":[0.56674]},{"name":"lg-miui-cash-test02.bj","data":[0.541867]}],[{"name":"zc-miui-cash-stag02.bj","data":[0.534287]},{"name":"lg-miui-cash-nginx00.bj","data":[0.530359]},{"name":"hh-miui-cash-nginx01.bj","data":[0.51938]},{"name":"lg-miui-cash-vm1002.bj","data":[0.515103]},{"name":"lg-miui-cash-vm1003.bj","data":[0.512898]},{"name":"hh-miui-cash-test04.bj","data":[0.510257]},{"name":"lg-miui-cash-mq01.bj","data":[0.510227]},{"name":"zc-miui-cash-stag-db00.bj","data":[0.508007]},{"name":"lg-miui-cash-lvs01.bj","data":[0.50737]},{"name":"lg-miui-cash-cache00.bj","data":[0.50019]}],[{"name":"lg-miui-cash-cs01.bj","data":[0.499903]},{"name":"lg-miui-cash-cs00.bj","data":[0.49932]},{"name":"lg-miui-cash-cs02.bj","data":[0.49354]},{"name":"zc-miui-cash-stag-db02.bj","data":[0.490603]},{"name":"lg-miui-cash-cache01.bj","data":[0.481947]},{"name":"zc-miui-cash-stag-nginx00.bj","data":[0.477927]},{"name":"lg-miui-cash-nginx01.bj","data":[0.475677]},{"name":"hh-miui-cash-test03.bj","data":[0.468517]},{"name":"zc-miui-cash-stag05.bj","data":[0.459953]},{"name":"hh-miui-cash-lvs00.bj","data":[0.45847]}],[{"name":"hh-miui-mibi-qatest00.bj","data":[0.45815]},{"name":"zc-miui-cash-stag-db01.bj","data":[0.444603]},{"name":"lg-miui-cash-lvs00.bj","data":[0.442763]},{"name":"zc-miui-cash-stag08.bj","data":[0.440717]},{"name":"zc-miui-cash-stag07.bj","data":[0.437923]},{"name":"lg-miui-cash-hbase00.bj","data":[0.427503]},{"name":"lg-miui-cash-hbase01.bj","data":[0.42334]},{"name":"zc-miui-cash-stag-db03.bj","data":[0.417473]},{"name":"hh-miui-cash-testdb01.bj","data":[0.162387]}]] ;
    d0 = data[0];
    console.log(d0);
    var cate = _.pluck(d0, 'name');
    var dd = _.flatten(_.pluck(d0, 'data'));
    console.log(cate);
    console.log(dd);
    var seri = [];
    seri[0] = {
        name: '使用的',
        data: _.flatten(_.pluck(d0, 'data'))
    };
    seri[1] = {
        name: '未使用的',
        data: _.map(_.flatten(_.pluck(d0, 'data')), function(i) {
            return 100 - i;
        })
    };
    console.log(seri);
/*
        series: [{
            name: '',
            data: [5, 3, 4, 7, 2]
        }, {
            name: 'Joe',
            data: [3, 4, 4, 2, 5]
        }]
*/

    $('#container').highcharts({

        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                viewDistance: 25,
                depth: 40
            },
            marginTop: 80,
            marginRight: 40
        },

        title: {
            text: 'Total fruit consumption, grouped by gender'
        },

        xAxis: {
            categories: cate
            // categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
        },

        yAxis: {
            allowDecimals: false,
            min: 0,
            max: 100,
            title: {
                text: 'Number of fruits'
            }
        },

        tooltip: {
            headerFormat: '<b>{point.key}</b><br>',
            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
        },

        plotOptions: {
            column: {
                stacking: 'normal',
                depth: 40
            }
        },

        series: seri
    });
});

