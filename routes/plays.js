var express = require("express");
var router = express.Router();
const db = require("../model/helper");

router.get("/", async function (req, res, next) {
  try {
    const id = req.query.id;
    const results = await db(`SELECT * FROM plays WHERE user_id = ${id};`);

    res.status(200).send(results.data);
  } catch (err) {
    res.status(500).send(err.message);
  }
});

router.post("/", async function (req, res, next) {
  try {
    const body = req.body;
    const {
      grandTotalGameScored,
      upperTotalScored,
      lowerTotalScored,
      countRound,
      countGame,
      yahtzeeScoreCount,
      gameComplete,
      userId,
    } = body;

    const timestamp = new Date().toISOString();
    const [date, time] = timestamp.split("T");
    const timeClean = time.split(".")[0];

    const timestampStr = `${date} ${timeClean}`;

    await db(`INSERT INTO plays(date_played, user_id, game_number, total_score_game, yahtzee_score_count, total_upper_wo_bonus, total_lower_wo_bonus, rounds_played, full_game)
    VALUES
        ('${timestampStr}', ${userId}, ${countGame}, ${grandTotalGameScored}, ${yahtzeeScoreCount}, ${upperTotalScored}, ${lowerTotalScored}, ${countRound}, ${gameComplete});`);

    res.send({ message: "Play saved successfully!" });
  } catch (err) {
    res.status(500).send(err.message);
  }
});

module.exports = router;
