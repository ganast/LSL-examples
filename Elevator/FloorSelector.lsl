/**
 * FloorSelector LSL example
 * 
 * A simple script that displays a menu on click containing a list of configured
 * choices. When a choice is made, its index in the list is sent as a chat
 * message over a configured chat channel. An example use case would be a floor-
 * selection panel for an elevator.
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

/*** Configuration ************************************************************/

/**
 * The title of the floor selection menu.
 */
string menu_title = "Please select floor";

/**
 * The list of floor names.
 */
list floor_names = ["Ground floor", "First floor", "Second floor", "Terrace"];

/**
 * The chat channel to which floor selection indices will be sent.
 */
integer elevator_private_channel = 1234;

/******************************************************************************/

/**
 * The chat channel for communication between the floor selection menu and this
 * script.
 */
integer floor_selector_private_channel = 4321;

/**
 * The one and only state of this script, in which it displays a floor-selection
 * menu and sends choices (i.e., indices of selected floor names in thee floor
 * names list) as chat messages.
 */
default {

	/**
	 * State-entry handler, sets-up communication between the floor-selection
	 * menu and this script.
	 */
    state_entry() {
		// start listening for choices on the menu...
        llListen(floor_selector_private_channel, "", NULL_KEY, "");
    }

	/**
	 * Touch event handler, responds with displaying the floor-selection menu.
	 */
    touch_start(integer total_number) {
		// display the menu on the user's viewer...
        llDialog(llDetectedKey(0), menu_title, floor_names, floor_selector_private_channel);
    }

	/**
	 * Listen event handler, responds with finding the selected floor name index
	 * in the floor names list and sending it to the configured chat channel.
	 */
    listen(integer chan, string name, key id, string msg) {
        
		// check if the message indeed came from the floor-selection menu...
		if (chan == floor_selector_private_channel) {
        
			// attempt to find the index of the choice made on the menu in the
			// floor names list...
			integer k = llListFindList(floor_names, msg);
            
			if (k != -1) {
				// if found, send it over the configured chat channel as a
				// string...
                llSay(elevator_private_channel, (string) k);
            }
        }
    }
}
