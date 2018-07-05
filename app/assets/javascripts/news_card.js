// open article in new windpw
$('#trending_coin_news').on('click', '.news-card', function(){
  var win = window.open($(this).data('url'), '_blank');
  if (win) {
    win.focus(); //Browser has allowed it to be opened
  } else {
    alert('Please allow popups for this website'); // Browser has blocked it
  }
});
