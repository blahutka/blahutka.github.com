$(document).ready(function () {
    var portfolioImages = {
        "najdijob":[
            ['site/public/images/najdijob/home2.png', 'descr 1'],
            ['site/public/images/najdijob/najdijob_search.png', 'descr 1']
        ],
        "adw":[
            ['site/public/images/adw/home.png', ''],
            ['site/public/images/adw/demo.png', ''],
            ['site/public/images/adw/how-it-works.png', '']
        ],
        "dentservis":[
            ['site/public/images/dentservis/dashboard.png', ''],
            ['site/public/images/dentservis/orders.png', ''],
            ['site/public/images/dentservis/orders_form.png', '']
        ],
        "ftuner":[
            ['site/public/images/ftuner/home.png', ''],
            ['site/public/images/ftuner/faq.png', '']
        ],
        "najdijob":[
            ['site/public/images/najdijob/home2.gif', ''],
            ['site/public/images/najdijob/search.png', ''],
            ['site/public/images/najdijob/search_range.png', '']
        ],
        "pservis":[
            ['site/public/images/pservis/dashboard.png', ''],
            ['site/public/images/pservis/orders.png', ''],
            ['site/public/images/pservis/form.png', '']
        ],
        "rgiant":[
            ['site/public/images/rgiant/home.png', '']
        ],
        "strechy-ondrik":[
            ['site/public/images/strechy-ondrik/home.png', ''],
            ['site/public/images/strechy-ondrik/gallery.png', '']
        ],
        "strelecdent":[
            ['site/public/images/strelecdent/home.gif', ''],
            ['site/public/images/strelecdent/modal_form.gif', ''],
            ['site/public/images/strelecdent/modal.gif', ''],
            ['site/public/images/strelecdent/admin.gif', ''],
            ['site/public/images/strelecdent/admin_img.gif', '']
        ],
        "ovault":[
            ['site/public/images/ovault/home.png']
        ],
        "trackwave": [
            ['site/public/images/trackwave/01.png', 'Search for multiple objects Users/Surveys'],
            ['site/public/images/trackwave/14.png', 'Visually edit survey and add to folders'],
            ['site/public/images/trackwave/02.png', 'Drag&Drop survey to folders'],
            ['site/public/images/trackwave/03.png', 'Questions search dropdown'],
            ['site/public/images/trackwave/04.png', 'Surfboards management'],
            ['site/public/images/trackwave/05.png', 'Surveys management'],
            ['site/public/images/trackwave/06.png', 'Dropdown - embed survey Widget'],
            ['site/public/images/trackwave/07.png', 'Dropdown - links to share public survey'],
            ['site/public/images/trackwave/08.png', 'Dropdown - Languages for sruvey'],
            ['site/public/images/trackwave/09.png', 'Dropdown - Add new survey member'],
            ['site/public/images/trackwave/16.png', 'Dropdown - Manage questions for survey'],
            ['site/public/images/trackwave/19.png', 'Dropdown - Add survey to surfboards'],
            ['site/public/images/trackwave/10.png', 'Dropdown - Share survey'],
            ['site/public/images/trackwave/12.png', 'Edit survey data'],
            ['site/public/images/trackwave/13.png', 'Edit survey data'],
            ['site/public/images/trackwave/15.png', 'Active users'],
            ['site/public/images/trackwave/21.png', 'Survey participant roles'],
            ['site/public/images/trackwave/22.png', 'Manage backend permissions']
        ],
        "brian": [
            ['site/public/images/brian/01.png', ''],
            ['site/public/images/brian/02.png', ''],
            ['site/public/images/brian/03.png', ''],
            ['site/public/images/brian/04.png', ''],
            ['site/public/images/brian/05.png', ''],
            ['site/public/images/brian/06.png', ''],
            ['site/public/images/brian/07.png', ''],
            ['site/public/images/brian/08.png', ''],
            ['site/public/images/brian/09.png', ''],
            ['site/public/images/brian/10.png', ''],
            ['site/public/images/brian/11.png', ''],
            ['site/public/images/brian/12.png', ''],
            ['site/public/images/brian/13.png', ''],
            ['site/public/images/brian/14.png', ''],
            ['site/public/images/brian/15.png', ''],
            ['site/public/images/brian/16.png', ''],
            ['site/public/images/brian/17.png', ''],
            ['site/public/images/brian/18.png', ''],
            ['site/public/images/brian/19.png', '']
        ], "cleaning_service": [
            ['site/public/images/cleaning_service/01.png', ''],
            ['site/public/images/cleaning_service/02.png', ''],
            ['site/public/images/cleaning_service/03.png', ''],
            ['site/public/images/cleaning_service/04.png', ''],
            ['site/public/images/cleaning_service/05.png', ''],
        ], "adeon": [
            ['site/public/images/adeon/00.png', ''],
            ['site/public/images/adeon/01.png', ''],
            ['site/public/images/adeon/02.png', ''],
            ['site/public/images/adeon/03.png', '']
        ]
    };

    $('a.show-gallery').click(function () {
        var id = $(this).attr('id');
        jQuery.slimbox(portfolioImages[id], 0);
        return false;
    })

})

$(document).ready(function () {
    $('.portfolio-tabs a:first').tab('show');
    //$(".nano").nanoScroller();
    $('.slim-content').slimScroll({
        height:'230px'
    });

    $('a.see-more').click(function () {
        $(this).parents('li.portfolio').find('.portfolio-tabs a:last').tab('show');
        return false;
    })
    //{ scroll:'top', flash:true, sliderMinHeight:40, alwaysVisible:true }
})
