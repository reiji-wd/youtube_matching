$(function($){
  $('.tab').click(function(){
    $('.menu-open').removeClass('menu-open');
    $(this).addClass('menu-open');
    $('.item-open').removeClass('item-open');

    const index = $(this).index();
    $('.menu-items').eq(index).addClass('item-open');
  });
});

