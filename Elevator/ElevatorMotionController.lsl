/**
 * ElevatorMotionController LSL example
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

list floor_heights = [0.1, 5.1, 10.1, 30.1];

integer elevator_private_channel = 1234;

float speed = 0.25;

/**
 *
 */
move(float height) {
    
    float hg = llGround(<0.0, 0.0, 0.0>);
    float h1 = hg + height;
    
    vector pos = llGetPos();
    float h0 = pos.z;
    float dir;
    if (h0 < h1) {
        dir = speed;
    }
    else {
        dir = -speed;
    }
    
    // llSay(0, "Moving from " + (string) h0 + " to " + (string) h1);

    // be cool...
    llPlaySound("elevator_ding", 1.0);

    // start moving (if necessary)...
    vector p = pos;
    while (llFabs(h1 - p.z) > 0.01) {
        p.z += dir;
        llSleep(0.1);
        llSetRegionPos(p);
    }
    
    // correct target height...
    p.z = h1;
    llSetRegionPos(p);
    
    // be cool again...
    llPlaySound("elevator_ding", 1.0);
}

/**
 *
 */
 default {
    state_entry() {
        llListen(elevator_private_channel, "", NULL_KEY, "");
    }
    
    listen(integer channel, string name, key id, string message) {
        if (channel == elevator_private_channel) {
            integer f = (integer) message;
            if (f >= 0 && f < llGetListLength(floor_heights)) {
                move(llList2Float(floor_heights, f));
            }
        }
    }
}
