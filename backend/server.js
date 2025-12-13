/* BRICK'S BRIDGE (The Backend Server)
   This code listens for messages from the Yellow Brick Road App 
   and talks to the Database.
*/

const express = require('express'); // The tool that listens for requests
const app = express();
const PORT = process.env.PORT || 3000;

// 1. Allow the app to send us JSON data (text/numbers)
app.use(express.json());

// 2. A Simple Test Route (To make sure the bridge is standing)
app.get('/', (req, res) => {
    res.send('🧱 Yellow Brick Road API is running! Brick is listening.');
});

/* -------------------------------------------------------
   BRICK'S EARS: LISTENING FOR APP COMMANDS
   -------------------------------------------------------
*/

// A. USER CHECK-IN (When the user says "I'm overwhelmed")
// The app sends this data here.
app.post('/emotional-check-in', (req, res) => {
    const { userId, mood, notes } = req.body;
    
    // TODO: In the future, we will save this to the 'EmotionalLogs' table in the database.
    console.log(`Brick heard: User ${userId} is feeling ${mood}. Notes: ${notes}`);

    // Brick's Logic: If mood is bad, suggest help.
    let reply = "Thanks for checking in.";
    if (mood === 'Overwhelmed') {
        reply = "I hear you. Do you want to switch to Burnout Mode?";
    }

    res.json({ 
        success: true, 
        message: reply,
        suggestedAction: mood === 'Overwhelmed' ? 'OFFER_BURNOUT_MODE' : 'NONE'
    });
});

// B. GET WORKBOOK (When the user needs their next step)
app.get('/workbook/:userId', (req, res) => {
    const userId = req.params.userId;
    
    // TODO: In the future, we will grab the real workbook from the 'Workbooks' table.
    // For now, we send a "fake" one to test the app.
    res.json({
        title: "ID Recovery",
        currentStep: "Find your Birth Certificate",
        stepId: 1
    });
});

// 3. Turn the Server On
app.listen(PORT, () => {
    console.log(`🧱 Brick Server is running on port ${PORT}`);
});
