var glitchShader:CustomShader = new CustomShader("GlitchShader");

function create() {
    bg.shader = glitchShader;
    glitchShader.uWaveAmplitude = 0.1;
    glitchShader.uFrequency = 5.0;
    glitchShader.uSpeed = 2.0;
}

var time:Float = 0.0;
function update(elapsed) {
    time += elapsed;
    glitchShader.hset("uTime", time);
}