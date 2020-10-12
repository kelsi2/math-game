Class brainstorm: math, players, turns, question
math class needs to store the logic for picking two numbers between 1-20
players class should track the lives (score) remaining (out of three), life is lost if they answer a question incorrectly. Score should be displayed for both players after each turn
turns class should track the current turn (who is the current_player) <= maybe move this into players
question tracks what current and previous questions are (should only be able to use a question once)

PLANNING UPDATE:
Only need two classes: players and questions
Turn and lives can be tracked in players
Initial math logic tracked in questions