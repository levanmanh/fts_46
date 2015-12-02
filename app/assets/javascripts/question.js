$(document).on("click", ".add_fields", function() {
  var association = $(this).attr("name");
  var regexp = new RegExp("new_" + association, "g");
  var new_id = new Date().getTime();
  $(this).parent().before(window[association + "_fields"].replace(regexp, new_id));
  return false;
});

$(document).on("click", ".delete_fields", function() {
  $(this).parent().find("input[type=hidden]").val("1");
  $(this).closest(".fields").remove();
  return false;
});

function addAnswerForm() {
  var association = "options";
  var regexp = new RegExp("new_" + association, "g");
  var new_id = new Date().getTime();
  $(".add_fields").parent().before(window[association + "_fields"].replace(regexp, new_id));
  $(".correct-select").hide();
}

$(document).on("change", ".question-type", function() {
  if($(this).val() == 0 || $(this).val() == 1) {
    $(".add_fields").show();
    $(".fields").remove();
  } else if($(this).val() == 2) {
    $(".add_fields").hide();
    $(".fields").remove();
    addAnswerForm();
  }
});

$(document).on("change", ".correct-option", function() {
  if($(".question-type").val() == 0) {
    var allCheckboxs = $(".correct-option").not($(this));
    allCheckboxs.each(function(index, cb) {
      $(cb).attr("checked", false);
    })
  }
});

