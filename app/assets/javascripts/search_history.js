// handle re-query from search history
$('.keyword-collection').on('click', '.collection-item', function(){
  $.ajax({
    url: 'search/trending',
    method: 'GET',
    dataType: 'script',
    format: 'js',
    data: {
      coin_name: $(this).data('keyword'),
      historic: true
    }
  })
});
