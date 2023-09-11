</div>

<script src="/template/admin/js/global.min.js"></script>
<script src="/template/admin/js/quixnav-init.js"></script>
<script src="/template/admin/js/custom.min.js"></script>
<script src="/template/admin/js/jquery.dataTables.min.js"></script>
<script src="/template/admin/js/datatables.init.js"></script>
<script>
    $(document).ready(function() {

        $('.delete').click(function(e) {
            const id = $(this).data('id')
            $('.lightbox').each(function(elem) {
                if ($(this).data('id') == id) {
                    $(this).addClass('active')
                }
            });
        })

        $('.no').click(function(e) {
            const id = $(this).data('id')
            $('.lightbox').each(function(elem) {
                if ($(this).data('id') == id) {
                    $(this).removeClass('active')
                }
            });
        })

        $('.yes').click(function() {
            const id = $(this).data('id');
            $(this).attr('href', `/admin/${id.replace(/[^a-zA-Z]+/g, '')}/delete/` + parceInt(id))
            $.post(`/admin/${id.replace(/[^a-zA-Z]+/g, '')}/delete/` + parceInt(id), {}, function(data) {
                $('.lightbox').each(function(elem) {
                    if ($(this).data('id') == id) {
                        $(this).removeClass('active')
                    }
                });
                $('.table-row').each(function(elem) {
                    if ($(this).data('id') == id) {
                        $(this).remove()
                    }
                });
            });
            return false;
        });

        $(".set-bg").each(function() {
            var bg = $(this).data("setbg");
            $(this).css("background-image", "url(" + bg + ")");
        });

        $(function() {
            $('.dropdown-item').click(function(e) {
                e.stopPropagation();
            });

            $("#column-selector input[type='checkbox']").each(function() {
                $("table ." + this.value).toggle($(this).is(":checked"));
            });

            $("#column-selector input[type='checkbox']").click(function() {
                var col = "." + this.value;
                $(col).toggle(this.checked);
                $("table thead th ." + col + ",table tbody td ." + col + ",table tfoot td ." + col).toggle();
            });

            $("#column-toggle").click(function() {
                var i = $("table thead th").index(this.closest("th"));
                $("table thead th,table tbody td,table tfoot td").eq(i).toggle();
            });
        });

    })
</script>

</body>

</html>