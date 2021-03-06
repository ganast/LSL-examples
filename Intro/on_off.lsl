/**
 * OnOff LSL intro example
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

// default state...
default {

    // triggered when this state is entered...
    state_entry() {

        // say something...
        llSay(0, "Initializing.");

		// transition to "off" state...
		state off;
	}
}

// off state...
state off {

    // triggered when this state is entered...
    state_entry() {

        // say something...
        llSay(0, "Turning off.");
	}

	// triggered when the object starts being touched when in this state...
    touch_start(integer total_number) {

		state on;
    }
}

// on state...
state on {

    // triggered when this state is entered...
    state_entry() {

        // say something...
        llSay(0, "Turning on.");
	}

	// triggered when the object starts being touched when in this state...
    touch_start(integer total_number) {

		state off;
    }
}
