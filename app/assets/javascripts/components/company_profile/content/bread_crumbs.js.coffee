{div, i, p} = React.DOM

@CompanyProfile_Content_BreadCrumbs = React.createFactory React.createClass
  render: ->
    (div className: 'hidden-xs hidden-sm col-md-2 content__navbar content__navbar_fixed',
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Briefly'))
      
      (div className: 'navbar__item item_active', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Product'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Traction'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Activity'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'People'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Funding'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Media'))
        
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title item__title_last', 'Jobs')))