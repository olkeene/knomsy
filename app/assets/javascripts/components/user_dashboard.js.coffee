{span, h2, div, h4, a, img} = React.DOM

@DashboardCompany = React.createFactory React.createClass

  render: ->
    tags = unless _.isEmpty(@props.company.category_list)
      _.map @props.company.category_list, (category, i)->
        (span className: "company-info__tag", key: "tag_#{i}", category)

    (div className: 'company',
      (div className: 'row',
        (div className: 'col-xs-12 col-sm-12 col-md-12 col-lg-12 company__inner',
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-1 company-logo',
            (img className: 'company-logo__image', src: 'http://lorempixel.com/60/60/abstract/9/')
          )
          (div className: 'col-xs-8 col-sm-8 col-md-8 col-lg-5 company-info',
            (a className: 'company-info__name', href: Routes.company_path(@props.company.id), @props.company.name)
            (div className: 'company-info__description', @props.company.short_desc)
            (div className: 'company-info__tags', tags)
          )
          (div className: 'col-xs-12 col-sm-12 col-md-12 col-lg-2 company-progress',
            (div className: 'company__label', 'Progress:')
            (div className: 'company-progress__bar',
              (div className: 'company-progress__bar company-progress__bar-done', style: {width: '80%'})
            )
          )
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-1',
            (div className: 'company__label', 'Followers')
            (div className: 'company__num', @props.company.followers_count)
          )
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-1',
            (div className: 'company__label', 'Followings')
            (div className: 'company__num', @props.company.followings_count)
          )
          (div className: 'col-xs-4 col-sm-4 col-md-4 col-lg-2 company-stat text-right',
            (span className: 'company__num company__num-up', '2,08')
            (span className: 'company-stat__state company-stat__state-up',
              (span clasName: 'fa fa-arrow-circle-up')
              (span null, '9.00%')
            )
          )
        )
      )
    )

@UserDashboard = React.createClass
  render: ->
    (div null,
      (h2 'Dashboard')

      (div className: 'content__section',
        (div className: 'section__body section__body_view',
          (div className: 'view-body',
            (div className: 'view-body__form row',
              (h4 className: 'text-left', 'Startups')

              (div className: 'companies',
                _.map @props.companies, (company, index) =>
                  DashboardCompany key: company.id, company: company)
            )))))
