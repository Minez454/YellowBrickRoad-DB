/* BRICK'S BRAIN - Database Schema 
   This file creates the tables that let Brick remember user states, 
   build workbooks, and track emotional health.
*/

-- 1. USER STATE (Tracks if they are Active, Burnout, or Crisis)
CREATE TABLE UserStates (
    state_id NUMBER PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    current_mode VARCHAR(50) DEFAULT 'Survival', -- Options: 'Survival', 'Burnout', 'Crisis', 'Maintenance'
    last_check_in DATETIME DEFAULT CURRENT_TIMESTAMP,
    burnout_counter NUMBER DEFAULT 0 -- Tracks how many tasks missed in a row
);

-- 2. EMOTIONAL LOGS (Remembering the "How are you?" check-ins)
CREATE TABLE EmotionalLogs (
    log_id NUMBER PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    check_in_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    mood_rating VARCHAR(50), -- e.g., 'Overwhelmed', 'Hopeful', 'Numb'
    trigger_event VARCHAR(255), -- Optional: What caused this mood?
    notes VARCHAR(500)
);

-- 3. WORKBOOKS (The custom guides Brick builds)
CREATE TABLE Workbooks (
    workbook_id NUMBER PRIMARY KEY,
    user_id NUMBER REFERENCES Users(user_id),
    title VARCHAR(100), -- e.g., "ID Recovery" or "Emergency Shelter"
    status VARCHAR(50) DEFAULT 'In Progress', -- 'Not Started', 'In Progress', 'Completed'
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. WORKBOOK STEPS (The specific tasks inside each workbook)
CREATE TABLE WorkbookSteps (
    step_id NUMBER PRIMARY KEY,
    workbook_id NUMBER REFERENCES Workbooks(workbook_id),
    step_order NUMBER, -- 1, 2, 3...
    instruction_text VARCHAR(1000), -- What Brick says to do
    is_completed NUMBER(1) DEFAULT 0, -- 0 = No, 1 = Yes
    agency_form_id VARCHAR(100) -- Optional link to a specific form
);
