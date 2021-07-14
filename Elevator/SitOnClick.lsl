/**
 * SitOnClick LSL example
 *
 * A simple script that allows the specification of a custom sit target, forces
 * a sit click-action and provides for custom handling of sit-down and stand-up
 * events. A typical use case would be an object serving as a sitting spot on
 * which avatars are to be seated in a certain way and which notifies some other
 * script about users sitting on it and standing up from it.
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
 * The sit target offset.
 */
vector sit_target_offset = <0.4, 0, 0.55>;

/**
 * The sit target rotation as euler angles, in degrees.
 */
vector sit_target_rotation_euler = <0, 0, 0>;

/**
 *
 */
on_sit_down(key avatar) {
    // TODO: ...
}

/**
 *
 */
on_stand_up(key avatar) {
    // TODO: ...
}

/******************************************************************************/

/**
 *
 */
key avatarOnSitTarget;

/**
 *
 */
default {

    state_entry() {
        avatarOnSitTarget = llAvatarOnSitTarget();
		llSitTarget(sit_target_offset, llEuler2Rot(sit_target_rotation_euler * DEG_TO_RAD));	
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
                on_sit_down(avatarOnSitTarget);
            }

            else if (avatarOnSitTarget != NULL_KEY && newAvatarOnSitTarget == NULL_KEY) {

                // someone stood up from the object...
                on_stand_up(avatarOnSitTarget);
                avatarOnSitTarget = newAvatarOnSitTarget;
            }
        }
    }
}