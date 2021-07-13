/**
 * SitOnClick LSL example
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
 *
 */
key avatarOnSitTarget;

/**
 *
 */
on_sit_start(key avatar) {
    // TODO: ...
}

/**
 *
 */
on_sit_end(key avatar) {
    // TODO: ...
}

/**
 *
 */
default {

    state_entry() {
        avatarOnSitTarget = llAvatarOnSitTarget();
		llSitTarget(<0.4, 0, 0.55>, llEuler2Rot(<0, 0, 0>*DEG_TO_RAD));	
        llSetClickAction(CLICK_ACTION_SIT);
    }

    changed(integer change) {
        // check if the change is because someone actually sat on or stood up
        // from the object...
        if (change & CHANGED_LINK) {
            key newAvatarOnSitTarget = llAvatarOnSitTarget();
            if (avatarOnSitTarget == NULL_KEY && newAvatarOnSitTarget != NULL_KEY) {
                // someone sat on the object...
                avatarOnSitTarget = newAvatarOnSitTarget;
                on_sit_start(avatarOnSitTarget);
            }
            else if (avatarOnSitTarget != NULL_KEY && newAvatarOnSitTarget == NULL_KEY) {
                // someone stood up from the object...
                on_sit_end(avatarOnSitTarget);
                avatarOnSitTarget = newAvatarOnSitTarget;
            }
        }
    }
}