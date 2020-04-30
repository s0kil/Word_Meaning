component Main {
  style wordFont {
    font-size: 30px;
    font-family: "Ubuntu", sans-serif;
    text-rendering: optimizeLegibility;
  }

  fun render {
    <div::wordFont>
      "Word Meaning"
    </div>
  }
}
