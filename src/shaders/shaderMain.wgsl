struct Global {
    time: f32,
}

struct Camera {
    matrix: mat4x4f,
}

struct Object {
    position: vec4f,
    orientation: vec4f,
    vertexData: array<vec4f>,
}

@group(0) @binding(0) var<uniform> glob: Global;
@group(0) @binding(1) var<uniform> cam: Camera;

@vertex
fn vert(@builtin(vertex_index) vertIndex: u32) -> @builtin(position) vec4f {
    let parallGram = array(
        vec4f(1, 0, -2, 1),
        vec4f(0, 1, -2, 1),
        vec4f(-1, 0, -2, 1),
        vec4f(1, 0, -2, 1),
        vec4f(0, 1, -2, 1),
        vec4f(2, 1, -2, 1),
    );

    // let perspective = mat4x4f(
    //     vec4f(1, 0, 0, 0),
    //     vec4f(0, 1, 0, 0),
    //     vec4f(0, 0, -1.001001, -1),
    //     vec4f(sin(glob.time), 0, -0.1001001, 0),
    // );

    let vertPos = parallGram[vertIndex];

    return cam.matrix * vertPos;
}

@fragment
fn frag() -> @location(0) vec4f {
    return vec4f(1, 0, 0, 1);
}
