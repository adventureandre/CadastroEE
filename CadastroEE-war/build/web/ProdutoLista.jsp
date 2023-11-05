<%@page import="java.text.DecimalFormat"%>
<%@page import="cadastroee.model.Produto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Listagem de Produtos</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
    </head>
    <body class="container">

        <h1>Listagem de Produtos</h1>

        <div class="text-end"><a class="btn btn-primary m-2" href="ServletProdutoFC?acao=formIncluir">Cadastrar Produto</a></div>

        <table class="table table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th>Preço</th>
                    <th>Ações</th>
                </tr>
            </thead>


            <%
                DecimalFormat df = new DecimalFormat("#,##0.00");
                List<Produto> produto = (List<Produto>) request.getAttribute("produtos");
                if (produto != null) {
                    for (Produto e : produto) {
            %>
            <tr>
                <td><%=e.getIdProduto()%></td>
                <td><%=e.getNome()%></td>
                <td><%=e.getQuantidade()%></td>
                <td>R$ <%=df.format(e.getPrecoVenda())%></td>                
                <td>
                    <a class="btn btn-primary btn-sm " href="ServletProdutoFC?acao=formAlterar&id=<%=e.getIdProduto()%>">Alterar</a>
                    <a class="btn btn-danger btn-sm" href="ServletProdutoFC?acao=excluir&id=<%=e.getIdProduto()%>">Excluir</a>
                </td>               
            </tr>
            <% }
            } else {
            %>
            <tr>
                <td colspan="5">Nenhum produto encontrado.</td>
            </tr>
            <% }
            %>   
        </table>

    </body>
</html>
