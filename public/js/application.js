$(document).ready(function() {

  $('#add-task').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');

    $(this).hide();
    $.get(url, function(task_form){
      $('.container').append(task_form);
    });
  });

  $('.container').on('submit', '#new-task-form', function(event){
    event.preventDefault();
    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(task){
      console.log(task);
      var li = todoTemplate(task);
      $('.incomplete ul').append(li);

    }, 'json');

    $('#new-task-form').remove();
    $('#add-task').show();

  });

  function todoTemplate(task){
    return "<li>" + task.name + "</li>";
  };

});
