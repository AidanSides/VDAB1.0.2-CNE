var time = 0.1;
function update(elapsed) {

    time += elapsed;

    dad.y += (Math.sin(time) * 0.2);
}