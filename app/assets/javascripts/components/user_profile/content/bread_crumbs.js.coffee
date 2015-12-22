{div, i, p} = React.DOM

@UserProfile_Content_BreadCrumbs = React.createFactory React.createClass
  render: ->
    (div className: 'hidden-xs hidden-sm col-md-2 content__navbar content__navbar_fixed',
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Profile info'))
      
      (div className: 'navbar__item item_active', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Investing'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Experience'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'Media'))
      
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title', 'References'))
        
      (div className: 'navbar__item', 
        (i className: 'item__icon fa fa-circle')
        (p className: 'item__title item__title_last', 'Widgets')))