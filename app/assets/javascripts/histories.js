var ellipsisText = function (e, etc) {
    var wordArray = e.innerHTML.split(" ");
    while (e.scrollHeight > e.offsetHeight) {
        wordArray.pop();
        e.innerHTML = wordArray.join(" ") + (etc || "...");
    }
};

$( document ).on('turbolinks:load', function() {
  [].forEach.call(document.querySelectorAll(".history-description"), function(elem) {
      ellipsisText(elem);
  });
})
