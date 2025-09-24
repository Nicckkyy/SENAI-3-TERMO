from django.db import models
from .models import *



class Pessoa(models.Model):
    nome = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    senha = models.CharField(max_length=128)

    def __str__(self):
        return self.nome
    

class Tarefa(models.Model):
    descricao = models.CharField(max_length=255)
    setor = models.CharField(max_length=100)
    usuario = models.ForeignKey(Pessoa, on_delete=models.CASCADE)  # Relacionamento com Pessoa
    prioridade = models.CharField(max_length=10, choices=[('Alta', 'Alta'), ('Média', 'Média'), ('Baixa', 'Baixa')])
    
    # Novo campo para status da tarefa
    STATUS_CHOICES = [
        ('fazer', 'Fazer'),
        ('fazendo', 'Fazendo'),
        ('concluido', 'Concluído')
    ]
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='fazer')

    def __str__(self):
        return self.descricao