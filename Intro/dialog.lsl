/**
 * Dialog LSL intro example
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

// ...
// Note that you can also cause the script to respond to listen events by sending chat messages manually to channel <dialog_channel>, with the chat command "/<dialog_channel> <message>", where <dialog_channel> is the chat channel defined below for communication with the dialog and <message> is a text message...

// set the chat channel number for communication with the dialog here...
integer dialog_channel= 427;

// the dialog's menu of options...
list menu = ["Red", "Green", "Blue", "White"]; 

// default state...
default {

    // triggered when this state is entered...
    state_entry() {

        // begin listening to the chat channel set-up for communication with the dialog...
        llListen(dialog_channel, "", NULL_KEY, ""); 
    }

    // handle touch events...
    touch_start(integer total_number) {

        // display the dialog...
        llDialog(
            llDetectedKey(0),
            "What color do you want to paint the object?",
            menu,
            dialog_channel
        );
    }

    // handle listen events...
    listen(integer channel, string name, key id, string choice) {
    
        // check if a valid choice has been made...
        if (llListFindList(menu, [choice]) != -1) { 

            // the "Red" option was chosen...
            if (choice == "Red") {

                // paint the prim red...
                llSetColor(<1.0, 0.0, 0.0>, ALL_SIDES);
            }

            // the "Green" option was chosen...
            else if (choice == "Green") { 

                // paint the prim green...
                llSetColor(<0.0, 1.0, 0.0>, ALL_SIDES);
            }

            // the "Blue" option was chosen...
            else if (choice == "Blue") { 

                // paint the prim blue...
                llSetColor(<0.0, 0.0, 1.0>, ALL_SIDES);
            }

            // the "White" option was chosen...
            else if (choice == "White") { 

                // paint the prim white...
                llSetColor(<1.0, 1.0, 1.0>, ALL_SIDES);
            }
        }
        else {
            // inform about the invalid choise made...
            llSay(0, "Invalid choice: " + choice);
        }
    }
}
