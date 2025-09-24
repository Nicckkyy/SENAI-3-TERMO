from django.contrib import admin
from django.urls import path, include
from .views import *


urlpatterns = [
    path('pessoas/', ListarPessoasAPIView.as_view(), name='listar_pessoas'),
    path('tarefas/', ListarTarefasAPIView.as_view(), name='listar_pessoas'),
    path('cadastrar/', CadastrarPessoaAPIView.as_view(), name='cadastrar_pessoa'),
    path('cadastrarTarefa/', CadastrarTarefasAPIView.as_view(), name='cadastrar_pessoa'),
    path('tarefas/<int:id>/', AtualizarTarefaAPIView.as_view(), name='atualizar_tarefa'),
]

