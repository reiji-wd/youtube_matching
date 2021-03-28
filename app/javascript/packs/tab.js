$(function() {
  let tabs = $(".tab");
  $(".tab").on("click", function(){
    $(".menu-open").removeClass("menu-open");
    $(this).addClass("menu-open");
    const index = tabs.index(this);
    $(".items").removeClass("item-open").eq(index).addClass("item-open");
  })
});