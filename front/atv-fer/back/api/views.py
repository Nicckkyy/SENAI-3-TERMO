from django.shortcuts import render, redirect
from django.http import HttpResponse
from .models import *   

from rest_framework.views import APIView
from rest_framework.generics import ListAPIView, CreateAPIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework import generics
from .serializer import *

# Create your views here.

def listar_tarefas(request):
    tarefas = Tarefa.objects.all()
    return render(request, "tarefas/lista.html", {"tarefas": tarefas})


class ListarTarefasAPIView(ListAPIView):
    serializer_class = TarefaSerializer

    def get_queryset(self):
        queryset = Tarefa.objects.all()

        # Filtrar por status, se o parâmetro de status for fornecido
        status = self.request.query_params.get('status', None)
        if status:
            queryset = queryset.filter(status=status)

        return queryset

class CadastrarTarefasAPIView(CreateAPIView  ):
    def post(self, request):
        # Recebe os dados do corpo da requisição
        serializer = TarefaSerializer(data=request.data)
        
        # Verifica se os dados são válidos
        if serializer.is_valid():
            # Salva a nova pessoa no banco de dados
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        # Se os dados forem inválidos, retorna erro
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class AtualizarTarefaAPIView(generics.UpdateAPIView):
    queryset = Tarefa.objects.all()
    serializer_class = TarefaSerializer
    lookup_field = 'id'  # Aqui usamos o 'id' para identificar a tarefa

    def patch(self, request, *args, **kwargs):
        return self.partial_update(request, *args, **kwargs)

class ListarPessoasAPIView(ListAPIView):
    queryset = Pessoa.objects.all()  # Todos os registros de pessoas
    serializer_class = PessoaSerializer  # Serializer para formatar os dados

class CadastrarPessoaAPIView(CreateAPIView  ):
    def post(self, request):
        # Recebe os dados do corpo da requisição
        serializer = PessoaSerializer(data=request.data)
        
        # Verifica se os dados são válidos
        if serializer.is_valid():
            # Salva a nova pessoa no banco de dados
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        
        # Se os dados forem inválidos, retorna erro
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
