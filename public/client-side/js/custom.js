$(document).ready(function() {
    $('#load-more').on('click', function() {
        var button = $(this);
        var page = button.data('page');
        
        $.ajax({
            url: '{{ route('products.load-more') }}',
            type: 'GET',
            data: { page: page },
            dataType: 'json',
            success: function(data) {
                $('#product-list').append(data.html);
                
                if (data.hasMore) {
                    button.data('page', page + 1);
                } else {
                    button.hide(); // Hide the button if no more products
                }
            }
        });
    });
});