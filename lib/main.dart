import 'package:consultaapi/models/domain_model.dart';
import 'package:consultaapi/view_models/domain_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DomainViewModel())],
      child: const MaterialApp(home: DomainSearchScreen(), debugShowCheckedModeBanner: false),
    ),
  );
}

class DomainSearchScreen extends StatefulWidget {
  const DomainSearchScreen({super.key});

  @override
  State<DomainSearchScreen> createState() => _DomainSearchScreenState();
}

class _DomainSearchScreenState extends State<DomainSearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<DomainViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Consulta Registro.br")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Domínio (ex: google.com.br)",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => vm.searchDomain(_controller.text),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            if (vm.isLoading) const CircularProgressIndicator(),
            if (vm.errorMessage != null) 
              Text(vm.errorMessage!, style: const TextStyle(color: Colors.red)),
            if (vm.domainData != null) Expanded(child: _buildResultList(vm.domainData!)),
          ],
        ),
      ),
    );
  }

  Widget _buildResultList(DomainModel data) {
    return ListView(
      children: [
        Card(
          color: data.statusCode == 0 ? Colors.green.shade50 : Colors.orange.shade50,
          child: ListTile(
            title: Text(data.fqdn, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("Status: ${data.statusDescription}"),
            trailing: Icon(
              data.statusCode == 0 ? Icons.check_circle : Icons.info,
              color: data.statusCode == 0 ? Colors.green : Colors.orange,
            ),
          ),
        ),
        _infoTile("Expira em", data.expiresAt ?? "N/A"),
        _infoTile("Status de Publicação", data.publicationStatus ?? "N/A"),
        if (data.hosts != null && data.hosts!.isNotEmpty)
          _infoTile("Hosts", data.hosts!.join(", ")),
        if (data.reasons != null)
          _infoTile("Motivos", data.reasons!.join(", ")),
        if (data.suggestions != null) ...[
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 8),
            child: Text("Sugestões:", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Wrap(
            children: data.suggestions!.map((s) => Chip(label: Text(s))).toList(),
          )
        ]
      ],
    );
  }

  Widget _infoTile(String label, String value) {
    return ListTile(
      title: Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontSize: 16)),
    );
  }
}