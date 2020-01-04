$(document).ready(function () {

    /*On this method when a change on the users dropdown is detected,
     * It will call the fillUserInformation() method to do the query
     * to the controller in order to fill the table. If "--" is selected,
     * Then the table is going to be cleared.
     * */
    $('#dropdownUsers').on('change', function () {
        if ($("#dropdownUsers option:selected").text().localeCompare("--") != 0) {
            fillUserInformation();
        }
        else {
            clearSelect();
        }
    });

    /*
     * Clears the user dropdown in case "--" is selected
     */
    function clearSelect() {
        $('#project_id_column').html("");
        $('#start_date_column').html("");
        $('#time_to_start_column').html("");
        $('#end_date_column').html("");
        $('#credits_column').html("");
        $('#status_column').html("");
    }

    /*
     * Makes the Ajax call to the Projects controller and retrieves the required information.
     * It takes as a parameter the user ID of the user that is selected.
     */
    function fillUserInformation() {
        var dropDownSelectedUserId = $("#dropdownUsers option:selected").attr("user_id");

        $.ajax({
            url: '/Projects/QueryUserInformation',
            method: "POST",
            data: { userId: dropDownSelectedUserId },
            dataType: "json",
            context: document.body
        }).done(function (data) {
            var projectsIds = "";
            var startDates = "";
            var timeToStart = "";
            var endDates = "";
            var credits = "";
            var isActive = "";

            jQuery.each(data, function (actualColumn, itemOfColumn) {
                jQuery.each(itemOfColumn, function (index2, element) {
                    switch (actualColumn) {
                        case "projectsIds":
                            projectsIds += element + "<br/>";
                            break;
                        case "startDates":
                            startDates += element + "<br/>";
                            break;
                        case "timeToStart":
                            timeToStart += element + "<br/>";
                            break;
                        case "endDates":
                            endDates += element + "<br/>";
                            break;
                        case "credits":
                            credits += element + "<br/>";
                            break;
                        case "isActive":
                            isActive += element + "<br/>";
                            break;
                        default:
                    }
                });
            });

            $('#project_id_column').html(projectsIds);
            $('#start_date_column').html(startDates);
            $('#time_to_start_column').html(timeToStart);
            $('#end_date_column').html(endDates);
            $('#credits_column').html(credits);
            $('#status_column').html(isActive);
        });
    }
});