/**
 * BadBadScript LSL intro example
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

// Perhaps, the definition of what a bad script is: a script that transitions
// between states continuously, rather than as a response to specific events,
// and without any delay in-between transitions.

default {
    state_entry() {
		llShout(0, "I am a bad, bad script! Shame on me!);
		state urgh;
	}
}

state urgh {
    state_entry() {
		llSetColor(<1.0, 0.0, 0.0>, ALL_SIDES);
		state ouch;
	}
}

state ouch {
    state_entry() {
		llSetColor(<0.0, 0.0, 0.0>, ALL_SIDES);
		state urgh;
	}
}
