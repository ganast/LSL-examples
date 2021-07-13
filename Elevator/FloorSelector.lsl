/**
 * FloorSelector LSL example
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
 
integer elevator_private_channel = 1234;
integer floor_selector_private_channel = 4321;

default {

    state_entry() {
        llListen(floor_selector_private_channel, "", NULL_KEY, "");
    }
    
    touch_start(integer total_number) {
        key avatar = llDetectedKey(0);
        llDialog(avatar, "Please select floor", ["Ground floor", "First floor", "Second floor", "Terrace"], floor_selector_private_channel);
    }

    listen(integer chan, string name, key id, string msg) {
        if (chan == floor_selector_private_channel) {
            if (msg == "Ground floor") {
                llSay(elevator_private_channel, "0");
            }
            else if (msg == "First floor") {
                llSay(elevator_private_channel, "1");
            }
            else if (msg == "Second floor") {
                llSay(elevator_private_channel, "2");
            }
            else if (msg == "Terrace") {
                llSay(elevator_private_channel, "3");
            }
        }
    }
}