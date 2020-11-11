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

    if ($('[id*=cmbPageSize]').val() !== '16') {
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