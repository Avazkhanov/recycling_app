import 'package:equatable/equatable.dart';
import 'package:recycling_app/core/utils/app_exports/app_export.dart';
import '../models/faq_model.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(const FaqState()) {
    on<LoadFaqData>(_onLoadFaqData);
  }

  Future<void> _onLoadFaqData(LoadFaqData event, Emitter<FaqState> emit) async {
    try {
      emit(state.copyWith(status: FormStatus.loading));

      final List<String> faqs = [
        'WHAT ARE SOME ITEMS WE SHOULD NEVER RECYCLE?',
        'WHAT IS COMPOSTING AND HOW IS IT BENEFICIAL FOR THE ENVIORNMENT?',
        'HOW CAN I RECYCLE HOUSEHOLD HAZARDOUS WASTE?',
        'WHERE DO I RECYCLE ELECTRONICS?',
        'HOW DO I PROPERLY RECYCLE SHARP ITEMS?',
      ];

      final List<String> quickTips = [
        'REMEMBER TO CLEAN OUT THE ITEMS BEFORE RECYCLING!',
        'RECYCLING ITEMS AND CONTAINERS THAT STILL HAVE FOOD ON THEM CAN CONTAMINATE AN ENTIRE TRUCKLOAD OF RECYCLING PRODUCTS! MAKE SURE ALL PRODUCTS ARE EMPTY, CLEAN, AND DRY BEFORE RECYLING!',
      ];

      final faqModel = FaqModel(
        faqs: faqs,
        quickTips: quickTips,
      );

      emit(state.copyWith(
        status: FormStatus.success,
        faqModel: faqModel,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
