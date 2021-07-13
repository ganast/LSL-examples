/**
 * TriggerVolume LSL example
 *
 * A sample LSL script illustrating the use of collision_start/end events (at a
 * very basic level). A typical use case would be a transparent or invisible
 * phantom trigger volume controlling something else via private chat commands
 * as user avatars enter and exit it.
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

/**
 * The private chat channel to send commands to.
 */
integer COMMS_CHANNEL = 55555;

/**
 * The handler for collision start events.
 */
on_collision_start(integer total_number) {
    
	// example use case: send a "on" command to the private chat channel...
	llSay(COMMS_CHANNEL, "on");
}

/**
 * The handler for collision end events.
 */
on_collision_end(integer total_number) {

	// example use case: send a "off" command to the private chat channel...
    llSay(COMMS_CHANNEL, "off");
}

/**
 * The default and only state, in which collision start and end events are
 * triggered as other object start and stop overlapping with this object,
 * respectively.
 */
default {

	state_entry() {
		// enable collision-detection...
        llVolumeDetect(TRUE);
    }
    
	collision_start(integer total_number) {
		// the prim is in collision with something else...
		on_collision_start(total_number);
    }

    collision_end(integer total_number) {
		// the prim has stopped being in collision with something else...
		on_collision_end(total_number);
    }
}
