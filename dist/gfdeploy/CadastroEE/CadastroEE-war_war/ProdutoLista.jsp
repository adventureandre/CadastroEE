<%@ page import="java.text.DecimalFormat" %>
<%@ page import="cadastroee.model.Produto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Listagem de Produtos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f4f4;
        }
        .card {
            margin-top: 30px;
            box-shadow: 0 4px 6px rgba(0,0,0,.1);
        }
        .table thead {
            background-color: #007bff;
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0,123,255,.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title text-center">Listagem de Produtos</h1>

                <div class="text-end mb-3">
                    <a class="btn btn-primary" href="ServletProdutoFC?acao=formIncluir">Cadastrar Produto</a>
                </div>

                <table class="table table-striped table-bordered table-responsive">
                    <thead>
                        <tr class="table-dark">
                            <th>ID</th>
                            <th>Produto</th>
                            <th>Quantidade</th>
                            <th>Preço</th>
                            <th>Ações</th>
                        </tr>
                    </thead>

                    <%
                        DecimalFormat df = new DecimalFormat("#,##0.00");
                        List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");

                        if (produtos != null && !produtos.isEmpty()) {
                            for (Produto produto : produtos) {
                    %>
                    <tr>
                        <td><%=produto.getIdProduto()%></td>
                        <td><%=produto.getNome()%></td>
                        <td><%=produto.getQuantidade()%></td>
                        <td>R$ <%=df.format(produto.getPrecoVenda())%></td>
                        <td>
                            <a class="btn btn-primary btn-sm" href="ServletProdutoFC?acao=formAlterar&id=<%=produto.getIdProduto()%>">Alterar</a>
                            <a class="btn btn-danger btn-sm" href="ServletProdutoFC?acao=excluir&id=<%=produto.getIdProduto()%>">Excluir</a>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">Nenhum produto encontrado.</td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
