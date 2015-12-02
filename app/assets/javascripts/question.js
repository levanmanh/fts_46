$(document).on("click", ".add_fields", function() {
  var association = $(this).attr("name");
  var regexp = new RegExp("new_" + association, "g");
  var new_id = new Date().getTime();
  $(this).parent().before(window[association + "_fields"].replace(regexp, new_id));
  return false;
});

$(document).on("click", ".delete_fields", function() {
  $(this).closest(".fields").find("input[type=hidden]").val("true");
  $(this).closest(".fields").hide();
  return false;
});

function addAnswerForm() {
  var association = "options";
  var regexp = new RegExp("new_" + association, "g");
  var new_id = new Date().getTime();
  $(".add_fields").parent().before(window[association + "_fields"].replace(regexp, new_id));
  $(".correct-select").hide();
}

/*
 * remove all options
 */
function changeToTextType() {
  var options = $(".fields");
  options.each(function(index, option) {
    $(option).find("input[type=hidden]").val("true");
  });
}

/*
 * remove answer and hide fields
 */
function changeFromTextType() {
  var options = $(".fields");
  options.each(function(index, option) {
    $(option).find("input[type=hidden]").val("true");
  });
  options.hide();
}

var previous;
$(document).on("focus", ".question-type", function() {
  previous = this.value;
});

$(document).on("change", ".question-type", function() {
  if($(this).val() == "single") {
    $(".add_fields").show();
    var allCheckboxs = $(".correct-option");
    allCheckboxs.each(function(index, cb) {
      $(cb).attr("checked", false);
    })
    if(previous == "text")
      changeFromTextType();
  } else if ($(this).val() == "multiple") {
    $(".add_fields").show();
    if(previous == "text")
      changeFromTextType();
  } else if($(this).val() == "text") {
    $(".add_fields").hide();
    $(".fields").hide();
    changeToTextType();
    addAnswerForm();
  }
  previous = $(this).val();
});

$(document).on("change", ".correct-option", function() {
  if($(".question-type").val() == "single") {
    var allCheckboxs = $(".correct-option").not($(this));
    allCheckboxs.each(function(index, cb) {
      $(cb).attr("checked", false);
    })
  }
});

