import 'package:flutter/material.dart';

class StoryGridView extends StatelessWidget {
  const StoryGridView({super.key});

  final List<String> _urls = const [
    'https://w.namu.la/s/556ae2813769fed7b8ca2258a252264b758323d38afd5f012c8c11a5dafbbef4edc00aaeb4464e0eac55e691ba2c605298682c3c081e59fdc65749fb1f4d389e4ea16f589cc23eea8e5916c4129e590fe5e8fda72361844855c6e4e3b740259f2d2509df51f16b64bce481a0780b4c8e',
    'https://w.namu.la/s/1b7a1f0b27dcd4ef21e10e73f808be8483d33c4870aff2cb0237687e993de924de88885ea9ce4a33577504d82c317b8394d44e5157ebf232255bfd92b2d1cbdb2a9c0d860209c4f478eae67ce39ff9c8e78722e85a8ee4da252aca256de4b886ece0a2e86545a123beee757520e5f1fd',
    'https://w.namu.la/s/0295995040062aba40e589d1e462526df46672ef27719a833ec316822c7a16473edcabf98ff9a314bdd292aad62a4fb52905d16361f249c688e8a388208d0a5c79b5281fc0e3936694807a39828a9fa38f672e014ec4e3e0d500f7c4f3a303c9b3d32dec8dff0b86af426435e21b992c',
    'https://w.namu.la/s/9b6958c92bd872aa7195f875043c76d5164c626d4fce8895fa8ad4f19979644050b78effddea7f4a9c3e6958eb24fdd343660af948ce31152e598425a4b5a95efe3d501d389117e027b189bef23463e2b4dca5b0c121f2b6c643cc67800b9b06448515057aad89e5dd49381bb10c313d',
    'https://w.namu.la/s/556ae2813769fed7b8ca2258a252264b758323d38afd5f012c8c11a5dafbbef4edc00aaeb4464e0eac55e691ba2c605298682c3c081e59fdc65749fb1f4d389e4ea16f589cc23eea8e5916c4129e590fe5e8fda72361844855c6e4e3b740259f2d2509df51f16b64bce481a0780b4c8e',
    'https://w.namu.la/s/1b7a1f0b27dcd4ef21e10e73f808be8483d33c4870aff2cb0237687e993de924de88885ea9ce4a33577504d82c317b8394d44e5157ebf232255bfd92b2d1cbdb2a9c0d860209c4f478eae67ce39ff9c8e78722e85a8ee4da252aca256de4b886ece0a2e86545a123beee757520e5f1fd',
    'https://w.namu.la/s/0295995040062aba40e589d1e462526df46672ef27719a833ec316822c7a16473edcabf98ff9a314bdd292aad62a4fb52905d16361f249c688e8a388208d0a5c79b5281fc0e3936694807a39828a9fa38f672e014ec4e3e0d500f7c4f3a303c9b3d32dec8dff0b86af426435e21b992c',
    'https://w.namu.la/s/9b6958c92bd872aa7195f875043c76d5164c626d4fce8895fa8ad4f19979644050b78effddea7f4a9c3e6958eb24fdd343660af948ce31152e598425a4b5a95efe3d501d389117e027b189bef23463e2b4dca5b0c121f2b6c643cc67800b9b06448515057aad89e5dd49381bb10c313d',
    'https://w.namu.la/s/556ae2813769fed7b8ca2258a252264b758323d38afd5f012c8c11a5dafbbef4edc00aaeb4464e0eac55e691ba2c605298682c3c081e59fdc65749fb1f4d389e4ea16f589cc23eea8e5916c4129e590fe5e8fda72361844855c6e4e3b740259f2d2509df51f16b64bce481a0780b4c8e',
    'https://w.namu.la/s/1b7a1f0b27dcd4ef21e10e73f808be8483d33c4870aff2cb0237687e993de924de88885ea9ce4a33577504d82c317b8394d44e5157ebf232255bfd92b2d1cbdb2a9c0d860209c4f478eae67ce39ff9c8e78722e85a8ee4da252aca256de4b886ece0a2e86545a123beee757520e5f1fd',
    'https://w.namu.la/s/0295995040062aba40e589d1e462526df46672ef27719a833ec316822c7a16473edcabf98ff9a314bdd292aad62a4fb52905d16361f249c688e8a388208d0a5c79b5281fc0e3936694807a39828a9fa38f672e014ec4e3e0d500f7c4f3a303c9b3d32dec8dff0b86af426435e21b992c',
    'https://w.namu.la/s/9b6958c92bd872aa7195f875043c76d5164c626d4fce8895fa8ad4f19979644050b78effddea7f4a9c3e6958eb24fdd343660af948ce31152e598425a4b5a95efe3d501d389117e027b189bef23463e2b4dca5b0c121f2b6c643cc67800b9b06448515057aad89e5dd49381bb10c313d',
    'https://w.namu.la/s/556ae2813769fed7b8ca2258a252264b758323d38afd5f012c8c11a5dafbbef4edc00aaeb4464e0eac55e691ba2c605298682c3c081e59fdc65749fb1f4d389e4ea16f589cc23eea8e5916c4129e590fe5e8fda72361844855c6e4e3b740259f2d2509df51f16b64bce481a0780b4c8e',
    'https://w.namu.la/s/1b7a1f0b27dcd4ef21e10e73f808be8483d33c4870aff2cb0237687e993de924de88885ea9ce4a33577504d82c317b8394d44e5157ebf232255bfd92b2d1cbdb2a9c0d860209c4f478eae67ce39ff9c8e78722e85a8ee4da252aca256de4b886ece0a2e86545a123beee757520e5f1fd',
    'https://w.namu.la/s/0295995040062aba40e589d1e462526df46672ef27719a833ec316822c7a16473edcabf98ff9a314bdd292aad62a4fb52905d16361f249c688e8a388208d0a5c79b5281fc0e3936694807a39828a9fa38f672e014ec4e3e0d500f7c4f3a303c9b3d32dec8dff0b86af426435e21b992c',
    'https://w.namu.la/s/9b6958c92bd872aa7195f875043c76d5164c626d4fce8895fa8ad4f19979644050b78effddea7f4a9c3e6958eb24fdd343660af948ce31152e598425a4b5a95efe3d501d389117e027b189bef23463e2b4dca5b0c121f2b6c643cc67800b9b06448515057aad89e5dd49381bb10c313d',
    'https://w.namu.la/s/556ae2813769fed7b8ca2258a252264b758323d38afd5f012c8c11a5dafbbef4edc00aaeb4464e0eac55e691ba2c605298682c3c081e59fdc65749fb1f4d389e4ea16f589cc23eea8e5916c4129e590fe5e8fda72361844855c6e4e3b740259f2d2509df51f16b64bce481a0780b4c8e',
    'https://w.namu.la/s/1b7a1f0b27dcd4ef21e10e73f808be8483d33c4870aff2cb0237687e993de924de88885ea9ce4a33577504d82c317b8394d44e5157ebf232255bfd92b2d1cbdb2a9c0d860209c4f478eae67ce39ff9c8e78722e85a8ee4da252aca256de4b886ece0a2e86545a123beee757520e5f1fd',
    'https://w.namu.la/s/0295995040062aba40e589d1e462526df46672ef27719a833ec316822c7a16473edcabf98ff9a314bdd292aad62a4fb52905d16361f249c688e8a388208d0a5c79b5281fc0e3936694807a39828a9fa38f672e014ec4e3e0d500f7c4f3a303c9b3d32dec8dff0b86af426435e21b992c',
    'https://w.namu.la/s/9b6958c92bd872aa7195f875043c76d5164c626d4fce8895fa8ad4f19979644050b78effddea7f4a9c3e6958eb24fdd343660af948ce31152e598425a4b5a95efe3d501d389117e027b189bef23463e2b4dca5b0c121f2b6c643cc67800b9b06448515057aad89e5dd49381bb10c313d',
    'https://w.namu.la/s/556ae2813769fed7b8ca2258a252264b758323d38afd5f012c8c11a5dafbbef4edc00aaeb4464e0eac55e691ba2c605298682c3c081e59fdc65749fb1f4d389e4ea16f589cc23eea8e5916c4129e590fe5e8fda72361844855c6e4e3b740259f2d2509df51f16b64bce481a0780b4c8e',
    'https://w.namu.la/s/1b7a1f0b27dcd4ef21e10e73f808be8483d33c4870aff2cb0237687e993de924de88885ea9ce4a33577504d82c317b8394d44e5157ebf232255bfd92b2d1cbdb2a9c0d860209c4f478eae67ce39ff9c8e78722e85a8ee4da252aca256de4b886ece0a2e86545a123beee757520e5f1fd',
    'https://w.namu.la/s/0295995040062aba40e589d1e462526df46672ef27719a833ec316822c7a16473edcabf98ff9a314bdd292aad62a4fb52905d16361f249c688e8a388208d0a5c79b5281fc0e3936694807a39828a9fa38f672e014ec4e3e0d500f7c4f3a303c9b3d32dec8dff0b86af426435e21b992c',
    'https://w.namu.la/s/9b6958c92bd872aa7195f875043c76d5164c626d4fce8895fa8ad4f19979644050b78effddea7f4a9c3e6958eb24fdd343660af948ce31152e598425a4b5a95efe3d501d389117e027b189bef23463e2b4dca5b0c121f2b6c643cc67800b9b06448515057aad89e5dd49381bb10c313d',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _urls.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 열마다 아이템의 개수
        mainAxisSpacing: 2, // 각 아이템 별 간격
        crossAxisSpacing: 2, // 아니면 GridView()를 Padding()으로 감싸도 된다
      ),
      itemBuilder: (BuildContext context, int index) {
        final url = _urls[index];
        return Image.network(
          url,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
