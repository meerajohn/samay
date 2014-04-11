var Pipeline = function () {

  var initForm = function () {
    $select_project = $('#pipeline_project_id').selectize({
      valueField: 'id',
      labelField: 'name',
      searchField: ['code', 'name'],
      create: false,
      render: { option: Selectizer.renderOptions },
      remoteUrl: '/projects/select.json',
      load: Selectizer.loadOptions
    });
    $select_item[0].selectize.focus();

    $('#pipeline_employee_id').selectize({
      valueField: 'id',
      labelField: 'name',
      searchField: ['code', 'name'],
      create: false,
      render: { option: Selectizer.renderOptions },
      remoteUrl: '/employees/select.json',
      load: Selectizer.loadOptions
    });

    $(document).on('selectize:load', function(event){
      console.log(event);
    });

  };
  return {
    index: function () {},

    new: function () {
      initForm();
    },

    create: function () {
      initForm();
    },

    edit: function () {
      initForm();
    },

    update: function () {
      initForm();
    },

    show: function () {},

    init: function () {
    }
  };

}();
