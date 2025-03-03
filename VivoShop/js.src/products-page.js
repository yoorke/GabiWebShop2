$(document).ready(function () {
    $('[id*=cmbPageSize]').change(function () {
        $('[id*=lblPageIndex]').val('');
        createQueryString();
    });

    $('[id*=cmbSort]').change(function () {
        createQueryString();
    });
});

function createQueryString() {
    var queryString = '';
    var exists = false;

    $.each($('[id*=chkFilterBrands]:checked'), function (key, value) {
        queryString += $(this).parent().attr('attributeValue') + ',';
    });
    if (queryString.length > 0) {
        queryString = 'brands=' + queryString;
        queryString = queryString.substring(0, queryString.length - 1);
        exists = true;
    }

    $.each($('[id*=chkAttributeValueID]:checked'), function (key, value) {
        queryString += (exists ? '&' : '') + 'attributes=' + $(this).parent().attr('attributevalue') + ',';
        queryString = queryString.substring(0, queryString.length - 1);
        exists = true;
    });

    if ($('[id*=cmbPageSize]').val() !== '15') {
        queryString += (exists ? '&' : '') + 'pageSize=' + $('[id*=cmbPageSize]').val();
        exists = true;
    }

    if ($('[id*=lblPageIndex]').val() !== '') {
        queryString += (exists ? '&' : '') + 'pageIndex=' + $('[id*=lblPageIndex]').val();
        exists = true;
    }

    if ($('[id*=cmbSort]').val() !== 'priceAsc') {
        queryString += (exists ? '&' : '') + 'sort=' + $('[id*=cmbSort]').val();
        exists = true;
    }

    var href = window.location.href;
    if (href.indexOf('?') > 0)
        href = href.substring(0, href.indexOf('?'));
    window.location = href + (queryString.length > 0 ? ('?' + encodeURI(queryString)) : '');
}

function changePage(pageIndex) {
    $('[id*=lblPageIndex').val(pageIndex - 1);
    createQueryString();
}