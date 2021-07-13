/**
 * Repeater LSL intro example
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

// A simple script to demonstrate chat listening. The script listens for chat messages fulfilling specific criteria and shouts them back on public chat along with the chatter's name.

// set the channel the repeater listens to here...
integer channel = PUBLIC_CHANNEL;

// set the name of the prim the repeater listens to, or "" to listen to all prims, here...
string name = "";

// set the key of the prim the repeater listens to, or NULL_KEY to listen to all prims, or llGetOwner() to listen to the owner of the prim the script is a part of, here...
key id = NULL_KEY;

// set the message the repeater listens for, or "" to listen for all messages, here...
string message = "";

// default state...
default {

    // triggered when this state is entered...
    state_entry() {

		// begin listening to chat according to the criteria defined...
		llListen(
            channel,
            name,
            id,
            message
        );
    }  

    // listen event handler...
    listen(
        integer channel,
        string name,
        key id,
        string message
    ) {
		// shout the message on public chat together with the chatter's message...
        llShout(0, name + " said \"" + message + "\"!");
    }
}
