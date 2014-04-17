//$(function() {
//    function addTask(task) {
//        $('#tasks').append('<li>' + task.name + '</ul>');
//    }
//
//    $('#new_task').submit(function(e) {
//        $.post('/tasks', $(this).serialize(), addTask);
//        this.reset();
//        e.preventDefault();
//    });
//
//    $.getJSON('/tasks', function(tasks) {
//        $.each(tasks, function() { addTask(this); });
//    });
//});
