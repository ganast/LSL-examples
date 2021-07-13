/**
 * TimerColorScale LSL intro example
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

// declare a vector to store scale values...
vector scale;

// default state...
default {

    // triggered when this state is entered...
    state_entry() {

        // set the timer to generate timer events
        // every one second... 
        llSetTimerEvent(1.0);
    }

    // timer event handler...
    timer() {

        // generate a new color and store it into a
        // vector...
        vector color = <
            llFrand(1.0),
            llFrand(1.0),
            llFrand(1.0)
        >;

        // apply the new color to all sides ot the
        // prim...
        llSetColor(color, ALL_SIDES);

        // modify the scale...
        scale.x = llFrand(10.0);
        scale.y = llFrand(10.0);
        scale.z = llFrand(10.0);

        // set the new size...
        llSetScale(scale);
    }
}
