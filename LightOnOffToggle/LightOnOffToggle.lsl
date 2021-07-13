/**
 * LightOnOffToggle LSL example
 * 
 * Copyright © 2021 George Anastassakis (ganast@ganast.com)
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

integer COMMS_CHANNEL = 55555;

vector COLOR_ON = <0.968, 0.888, 0.031>;
vector COLOR_OFF = <0.5, 0.5, 0.5>;

float GLOW_ON = 0.2;

vector LIGHT_COLOR = <0.968, 0.888, 0.031>;
float LIGHT_INTENSITY = 1;
float LIGHT_RADIUS = 20;
float LIGHT_FALLOFF = 0.01;

set_light_active(integer isActive) {

    float glow;
    if (isActive == TRUE) {
        glow = GLOW_ON;
    }
    else {
        glow = 0.0;
    }

    llSetPrimitiveParams([
        PRIM_GLOW, ALL_SIDES, glow,
        PRIM_POINT_LIGHT, isActive,
            LIGHT_COLOR, LIGHT_INTENSITY,
            LIGHT_RADIUS, LIGHT_FALLOFF
    ]);
}

default {
    
    state_entry() {
        state off;
    }
}

state on {
    
    state_entry() {
        llListen(COMMS_CHANNEL, "", "", "");
        llSetColor(COLOR_ON, ALL_SIDES);
        set_light_active(TRUE);
    }

    listen(integer channel, string name, key id, string message) {
        if (llToUpper(message) == "OFF" || llToUpper(message) == "TOGGLE") {
            state off;
        }
    }
}

state off {

    state_entry() {
        llListen(COMMS_CHANNEL, "", "", "");
        llSetColor(COLOR_OFF, ALL_SIDES);
        set_light_active(FALSE);
    }

    listen(integer channel, string name, key id, string message) {

        if (llToUpper(message) == "ON" || llToUpper(message) == "TOGGLE") {
            state on;
        }
    }
}
