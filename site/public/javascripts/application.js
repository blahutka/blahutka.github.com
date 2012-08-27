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
        ]
    };

    $('.thumbnail a').click(function () {
        var id = $(this).attr('id');
        jQuery.slimbox(portfolioImages[id], 0);
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
