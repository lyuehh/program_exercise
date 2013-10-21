/* global console */
var color = 'blue';

function changeColor() {
    if (color === 'blue') {
        color = 'red';
    } else {
        color = 'blue';
    }
}
changeColor(color);
console.log(color);
