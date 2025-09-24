from rest_framework import serializers
from .models import *

class PessoaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pessoa
        fields = ['id', 'nome', 'email', 'senha']

class TarefaSerializer(serializers.ModelSerializer):
    usuario = serializers.PrimaryKeyRelatedField(queryset=Pessoa.objects.all())  # Relacionamento com Pessoa

    class Meta:
        model = Tarefa
        fields = ['id', 'descricao', 'setor', 'usuario', 'prioridade', 'status'] 
