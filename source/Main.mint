/*
  API
  https://dictionaryapi.dominate.workers.dev/?word=new
*/

component Main {

  style wordFont {
    font-size: 30px;
    font-family: "Ubuntu", sans-serif;
    text-rendering: optimizeLegibility;
  }

  fun render : Html {
    <div::wordFont>
      <{ "Hello Mint!" }>
    </div>
  }
}
