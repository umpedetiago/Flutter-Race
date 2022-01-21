import 'package:meuapp/shared/models/user_model.dart';
import 'package:meuapp/shared/services/app_database.dart';
import 'package:supabase/supabase.dart';

class SupabaseDatabase implements AppDatabase {
  late final SupabaseClient client;

  SupabaseDatabase() {
    init();
  }

  @override
  void init() {
    client = SupabaseClient(
      const String.fromEnvironment("SUPABASEURL"),
      const String.fromEnvironment("SUPABASEKEY"),
    );
    print("database initialized");
    print("URL:${client.supabaseUrl}, KEY: ${client.supabaseKey}");
  }

  @override
  Future<UserModel> createAccount(
      {required String email,
      required String password,
      required String name}) async {
    final response = await client.auth.signUp(email, password);
    if (response.error == null) {
      final user = UserModel(email: email, id: response.user!.id, name: name);
      await createUser(user);
      return user;
    } else {
      throw Exception(
          response.error?.message ?? "Não foi possivel criar conta");
    }
  }

  @override
  Future<UserModel> login(
      {required String email, required String password}) async {
    final response = await client.auth.signIn(email: email, password: password);
    if (response.error == null) {
      final user = UserModel.fromMap(response.user!.toJson());
      return user;
    } else {
      throw Exception(
          response.error?.message ?? "Não foi possivel realizar login");
    }
  }

  @override
  Future<UserModel> createUser(UserModel user) async {
    final response = await client.from("users").insert(user.toMap()).execute();
    if (response.error == null) {
      return user;
    } else {
      throw Exception("Não foi possivel cadastrar o usuario");
    }
  }

  @override
  Future<UserModel> getUser(String id) async {
    final response =
        await client.from("users").select().filter("id", "eq", id).execute();
    if (response.error == null) {
      final user = UserModel.fromMap(response.data);
      return user;
    } else {
      throw Exception("não foi possivel buscar o usuario");
    }
  }
}
