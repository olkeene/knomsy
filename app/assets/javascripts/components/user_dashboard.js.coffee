{span, h2, div, h4, a, li} = React.DOM

@DashboardCompany = React.createFactory React.createClass
  
  render: ->
    tags = unless _.isEmpty(@props.company.role_list)
      _.map @props.company.role_list, (role, i)->
        (li className: "label__item label label-default", key: "tag_#{i}", role)
    
    (span null,
      (div className: 'row',
        (div className: 'col-xs-12 col-sm-12 col-md-12 col-lg-12',
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-6 text-left',
            (a href: Routes.company_path(@props.company.id), @props.company.name)
            (div null, @props.company.short_desc)
            tags
          )
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-2', 'Progress')
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-2', 'Stat')
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-2', 'Stat')
      ))
      (div className: 'row',
        (div className: 'with-bottom-line'))
    )

@UserDashboard = React.createClass
  render: ->
    (span null,
      (h2 'Dashboard')
      
      (div className: 'content__section',
        (div className: 'section__body section__body_view',
          (div className: 'view-body',
            (div className: 'view-body__form row',
              (h4 className: 'text-left', 'Startups')
              
              (div className: 'companies',
                _.map @props.companies, (company)=>
                  DashboardCompany key: company.id, company: company)
            )))))
