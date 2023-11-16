import 'package:get/get.dart';
import 'package:mediquest/app/ui/my_appbar.dart';

class Achievement {
  RxString title, imagePath, description, physiopathology, conditionText;
  RxInt condition;
  int valueCondition;

  Achievement(
      this.title,
      this.imagePath,
      this.description,
      this.physiopathology,
      this.condition,
      this.valueCondition,
      this.conditionText);
}

RxList<Achievement> achievementList = RxList<Achievement>.of([
  Achievement(
      'Hipertensión arterial'.obs,
      'assets/achievements_images/hipertensión_arterial.png'.obs,
      'El término hipertensión hace referencia a la presencia de presiones arteriales elevadas en todo el organismo. La hipertensión es extremadamente común en EE. UU., afecta a uno de cada tres adultos, y la mayoría de los adultos con hipertensión no son conscientes de que padecen esta enfermedad. La variación de la presión arterial a lo largo del día es un fenómeno normal. La presión arterial puede aumentar temporalmente en respuesta a numerosos factores, como el estrés, los medicamentos, los patrones de sueño o la ingesta de líquidos/sodio en un paciente sin hipertensión crónica. Sin embargo, una elevación persistente e incontrolada de la presión arterial puede provocar complicaciones peligrosas.\n\nLa hipertensión aumenta con el tiempo el riesgo de cardiopatía isquémica, ictus y enfermedad renal crónica, y es el principal factor de riesgo de hemorragia intracraneal. Los hombres normotensos a los 50 años viven unos 7 años más que sus homólogos hipertensos. También se han observado resultados similares en las mujeres. Por tanto, el diagnóstico y el tratamiento oportunos pueden prevenir estas complicaciones mortales.'
          .obs,
      'La hipertensión primaria (esencial) se refiere a la hipertensión que no puede atribuirse a otra causa. La etiología subyacente de la hipertensión primaria es multifactorial. La presión arterial se ve afectada y regulada por una multitud de factores; entre ellos, el sistema nervioso simpático y parasimpático, el sistema renina-angiotensina-aldosterona (SRAA), las citocinas circulantes y los glucocorticoides. Las causas del desarrollo de presiones arteriales elevadas dentro del sistema cardiovascular son secundarias a esta compleja interacción. En cualquier caso, una vez que la vasculatura del cuerpo se ve sometida a presiones sostenidas y más elevadas, los propios vasos se remodelan para adaptarse a la mayor presión, lo que provoca efectos nocivos en órganos terminales como los riñones, el cerebro y la retina. Del mismo modo, debido al aumento de la poscarga, el ventrículo izquierdo se remodelará y se hipertrofiará.'
          .obs,
      playerController.highestLevels[0],
      2,
      'Responde correctamente 1 pregunta de histología'.obs),
  Achievement(
      'Diabetes mellitus'.obs,
      'assets/achievements_images/diabetes_mellitus_2.png'.obs,
      'La diabetes mellitus es una enfermedad crónica caracterizada por la insuficiencia de insulina, la resistencia a la insulina y sus consiguientes comorbilidades. Según los datos del censo de 2014, entre 2009 y 2012 afectó a 29,1 millones de estadounidenses adultos, es decir, el 9,3% de la población estadounidense. En 2012 se diagnosticaron más de 1,5 millones de nuevos casos. La diabetes se ha asociado a múltiples complicaciones, como hipertensión, enfermedades cardiovasculares, accidentes cerebrovasculares, ceguera, enfermedades renales y amputaciones.'
          .obs,
      'La fisiopatología de la diabetes varía según el tipo. La diabetes mellitus de tipo 1 (DM1) se caracteriza por la destrucción mediada por la autoinmunidad de las células de los islotes β del páncreas, lo que suele provocar una deficiencia completa de insulina. En este proceso se han implicado varios autoanticuerpos, como anti-GAD65, anti-células de los islotes, anti-transportador de zinc y antiinsulina. La etiología de esta autoinmunidad aún no se ha dilucidado del todo, pero se cree que es una combinación de predisposición genética y factores ambientales.\n\nA diferencia de la DM1, la diabetes mellitus de tipo 2 (DM2) se caracteriza por una resistencia a la insulina, una secreción de insulina reducida (pero no ausente) y una producción excesiva de glucosa en el hígado. Numerosos estudios han sugerido la existencia de mecanismos relacionados con las citocinas proinflamatorias, la desregulación del tejido adiposo y la desregulación de la expresión del receptor de insulina o de la señalización intracelular.\n\nTanto si se trata de una deficiencia absoluta de insulina (como en la DM1) como de una insuficiencia relativa de insulina (como en la DM2), el organismo es incapaz de captar la glucosa del torrente sanguíneo debido al deterioro de las proteínas transportadoras de glucosa. Sin glucosa, el organismo percibe un estado general de ayuno que estimula la producción hepática de glucosa ( fig. 69.1 ). El subsiguiente aumento de la glucosa sérica también incrementa la osmolalidad sérica, lo que da lugar a glucosuria y poliuria, que conducen a una depleción general del volumen corporal que luego estimula la sed y la polidipsia.'
          .obs,
      playerController.highestLevels[1],
      2,
      'Resuelve correctamente 1 pregunta de fisiología'.obs),
  Achievement(
      'Asma'.obs,
      'assets/achievements_images/asma.png'.obs,
      'El asma es un complejo trastorno crónico de las vías respiratorias caracterizado por síntomas variables y recurrentes, obstrucción del flujo de aire, hiperreactividad bronquial, proliferación del músculo liso e inflamación subyacente. El asma es una enfermedad común, cuya prevalencia ha aumentado en todo el mundo a lo largo de varias décadas y ahora se reconoce como una causa importante de discapacidad, gasto médico y muerte evitable'
          .obs,
      'El asma se caracteriza por la obstrucción episódica de las vías respiratorias, la hiperinsuflación pulmonar y la limitación del flujo de aire como resultado de múltiples procesos celulares y moleculares. Las respuestas inmunes de tipo 2 en las vías respiratorias inferiores son la principal anomalía inmunológica de la enfermedad y están mediadas por los linfocitos T cooperadores de tipo 2 (Th2) CD4+ y la inmunoglobulina E (IgE). Las respuestas inmunes de tipo 2 impulsan una cascada de acontecimientos posteriores, como la hipersensibilidad mediada por IgE, la activación de las células epiteliales de las vías respiratorias, la quimioatracción de las células efectoras (mastocitos, eosinófilos y basófilos) y la remodelación del epitelio y la matriz subepitelial. Los eosinófilos son las células más características que se acumulan en el asma y la inflamación alérgica; su presencia suele estar relacionada con la gravedad de la enfermedad. Los mastocitos también aumentan en número en las vías respiratorias asmáticas y pueden encontrarse en estrecha asociación con las células del músculo liso de las vías respiratorias. Además de producir mediadores broncoconstrictores (p. ej., histamina, prostaglandinas y leucotrienos), los mastocitos también almacenan y liberan el factor de necrosis tumoral α (TNF-α), que es importante en el reclutamiento y la activación de las células inflamatorias y en la alteración de la función del músculo liso de las vías respiratorias.'
          .obs,
      playerController.highestLevels[2],
      2,
      'Resuelve correctamente 1 pregunta de bioquímica'.obs),
  Achievement(
      'Migraña'.obs,
      'assets/achievements_images/migraña.png'.obs,
      'La migraña es la cefalea primaria incapacitante más común, estimándose que la sufre aproximadamente un 12% de la población, teniendo las mujeres una mayor predisposición. Es una enfermedad crónica recurrente generalmente caracterizada por cefalea pulsátil acompañada de sintomatología autonómica, fotofobia y/o fonofobia. Puede presentar una gran variedad de presentaciones clínicas, las formas más estudiadas son la migraña con y sin aura.'
          .obs,
      'Anteriormente se tenía la teoría vascular de que durante la migraña, la cefalea era ocasionada por vasodilatación y el aura se daba como resultado de vasoconstricción. Esto se ha descartado en la actualidad debido a ataques migrañosos espontáneos vistos en angiografía por resonancia magnética, donde no hay dilatación arterial extraneal y apenas mínima dilatación arterial intracraneal.\n\nLa teoría actual sugiere que una disfunción neuronal primaria, lleva a una secuencia de cambios intra y extra craneales que desembocan en migraña. Esta disfunción neuronal primaria lleva a una depresión de propagación cortical, esta es una onda autopropagante de despolarización neuronal y glial que va a través de la corteza cerebral que finalmente lleva a desarrollar el aura, activar aferencias del trigémino y alterar la permeabilidad de la barrera hematoencefálica por regulación positiva y activación de metaloproteinasas de matriz.\n\nUna vez que se activan fibras aferentes del nervio trigémino por medio de la depresión de propagación cortical, este ocasiona cambios inflamatorios en las meninges, llevando a la cefalea característica de la migraña.\n\nRol de la serotonina: Se cree que la serotonina juega un papel importante en la migraña o por lo menos en el tratamiento agudo de esta, esto debido al hecho de que los antidepresivos tricíclicos, los cuales son bloqueadores de la recaptación de serotonina, son efectivos como agentes profilácticos antimigrañosos. Sin embargo, otros inhibidores de la recaptación de serotonina más selectivos, no han sido muy efectivos.\n\nRol del CGRP: También se ha evidenciado que el péptido relacionado con el gen de la calcitonina (CGRP) puede jugar un papel importante en el desarrollo de la migraña, esto basado en que la estimulación del nervio trigémino causa liberación de CGRP y, que la infusión de este péptido en pacientes con antecedente de migraña puede desencadenar ataques migrañosos. Además hay estudios donde se han registrado niveles elevados de CGRP en sangre venosa yugular externa durante los ataques de migraña, y otros donde se evidencia normalización de niveles de CGRP después de la administración de sumatriptán, un agonista del receptor de serotonina 1b/1d.'
          .obs,
      playerController.adsSeen,
      1,
      'Mira 1 anuncio para conseguir vidas'.obs),
  Achievement(
      'Artritis reumatoide'.obs,
      'assets/achievements_images/artritis.png'.obs,
      'La artritis reumatoide (AR) es un trastorno inflamatorio, sistémico y crónico que se caracteriza por dolor e hinchazón simétricos de las articulaciones, rigidez matutina y fatiga. La AR es una enfermedad de curso variable, a menudo con períodos de reagudizaciones y, menos a menudo, con períodos de latencia. Los resultados varían desde enfermedad que remite, pocas veces observada, hasta enfermedad grave, que produce discapacidad y, en algunos pacientes, muerte prematura.\n\nSin tratamiento, la mayoría de los pacientes presentan afectación articular progresiva y discapacidad en pocos años. Desde la introducción del metotrexato en 1985 y de los inhibidores del factor de necrosis tumoral α (TNF-α) en la década de los noventa, se ha producido un cambio en la pauta de tratamiento. En la actualidad, se dispone de numerosos abordajes convencionales y biológicos para tratar de manera eficaz esta enfermedad crónica, antes gravemente debilitante.'
          .obs,
      'La artritis reumatoide es una enfermedad heterogénea, de patogenia compleja. Se trata de un diagnóstico clínico que se presenta como fenotipo clínico único, aunque, a menudo, el genotipo inmunológico patógeno subyacente no es uno solo. Diversas vías de señalización conducen a menudo a la misma presentación clínica.\n\nLa inflamación de la membrana sinovial es característica de la AR. Los procesos específicos que conducen a esta inflamación y a la proliferación celular son pérdida de tolerancia, producción de citocinas y producción de autoanticuerpos. Están implicadas diversas vías de señalización de citocinas, detectándose en la sinovial y en sangre periférica la citocina predominante interleucina 1 (IL-1), la IL-6, el TNF-α y el factor estimulante de colonias de granulocitos-macrófagos (GM-CSF).\n\nLa patogenia de la AR se produce por etapas. En la fase de inducción, la anatomía del revestimiento sinovial dentro de la articulación permite el reclutamiento de células inflamatorias.\nLa fase destructiva, que puede ser dependiente o independiente del antígeno, tiene elementos mesenquimatosos, como fibroblastos y sinoviocitos. La diferenciación local y la activación de los osteoclastos da lugar a erosiones óseas, mientras que la lesión del cartílago parece tener su causa en enzimas proteolíticas producidas por sinoviocitos, macrófagos y neutrófilos del líquido sinovial.'
          .obs,
      playerController.highestLevels[0],
      11,
      'Responde correctamente 10 preguntas de histología'.obs),
  Achievement(
      'Hipotiroidismo'.obs,
      'assets/achievements_images/hipotiroidismo.png'.obs,
      'El hipotiroidismo, que se caracteriza por una deficiencia de la hormona tiroidea, es uno de los trastornos endocrinos más comunes. Puede ser el resultado de un defecto en cualquier punto del eje hipotálamo-hipofisario-tiroideo (HHT); la disfunción primaria de la glándula tiroides es la causa más común, aunque con poca frecuencia el responsable es un proceso central. El diagnóstico del hipotiroidismo clínico requiere la identificación de una constelación de síntomas compatibles con la enfermedad y el inicio de una terapia hormonal sustitutiva para mitigar los síntomas.'
          .obs,
      'En el hipotiroidismo primario, la disminución de las concentraciones de T 3 y T 4 provoca un aumento compensatorio de la TSH; por tanto, el hipotiroidismo manifiesto se diagnostica por la elevación de la TSH (a menudo mayor de 10 mU/l) y la disminución de la T 4 libre. El hipotiroidismo subclínico se diagnostica en pacientes con niveles elevados de TSH, pero normales de T 4 libre; estos pacientes suelen carecer de los signos y síntomas clásicos del hipotiroidismo.\n\nDado que el yodo es fundamental para la producción de la hormona tiroidea, su carencia es la principal causa de hipotiroidismo en todo el mundo. En las regiones donde hay suficiente yodo, como EE. UU., o en los países que enriquecen sus alimentos con yodo, la tiroiditis autoinmune crónica (tiroiditis de Hashimoto) es la etiología más comúnmente implicada. La tiroiditis de Hashimoto puede presentar una destrucción del tejido tiroideo mediada tanto por células como por anticuerpos. La histología revela una infiltración linfocítica, y la inmensa mayoría de los pacientes con hipotiroidismo manifiesto tendrán elevados autoanticuerpos, sobre todo el anticuerpo contra la peroxidasa tiroidea (TPO). La medición rutinaria de los autoanticuerpos tiroideos no se recomienda para el diagnóstico y solo se utiliza en el contexto de la enfermedad subclínica o en presencia de bocio para predecir la progresión de la enfermedad.\n\nEl hipotiroidismo central se caracteriza por una función hipotálamo-hipofisaria anormal, que conduce a una estimulación inadecuada de la glándula tiroides. Este defecto puede deberse a una disminución de la hormona liberadora de tirotropina (TRH) a nivel del hipotálamo o a una disminución de la secreción de TSH por parte de la hipófisis anterior. Los pacientes con hipotiroidismo central tienen signos y síntomas de hipotiroidismo y suelen presentar niveles bajos de T 4 libre, pero los niveles de TSH pueden ser bajos, normales (inadecuados) o ligeramente elevados (generalmente por debajo de 10 mU/l). Los pacientes con hipotiroidismo central suelen presentar otras anomalías endocrinas que sugieren una disfunción central, como el hipogonadismo y el hipocortisolismo.\n\nEl síndrome del enfermo eutiroideo, o síndrome de enfermedad no tiroidea, denota cambios en las pruebas de función tiroidea durante una enfermedad crítica. Casi tres cuartas partes de los pacientes hospitalizados pueden desarrollar anomalías en el eje HHT, que se resuelven tras la resolución de la enfermedad aguda no tiroidea. Los niveles de T 3 disminuyen primero, seguidos de los de T 4 total y posteriormente de los de TSH. La T 4 libre tiende a estar conservada en las fases agudas de la enfermedad no tiroidea, y la T4 libre baja es un signo de mal pronóstico general. La anamnesis y la exploración física son fundamentales para distinguir las anomalías en las pruebas de función tiroidea que son consecuencia del síndrome del enfermo eutiroideo de las anomalías que significan un hipotiroidismo verdadero y manifiesto, pero estas entidades suelen ser difíciles de distinguir en los pacientes hospitalizados. Puede ser útil medir la T 3 inversa, que está elevada en casos de enfermedad no tiroidea, mientras que es baja en el hipotiroidismo verdadero.'
          .obs,
      playerController.highestLevels[1],
      11,
      'Resuelve correctamente 10 preguntas de fisiología'.obs),
  Achievement(
      'Enfermedad inflamatoria intestinal'.obs,
      'assets/achievements_images/Crohn.png'.obs,
      'La enfermedad inflamatoria intestinal (EII) abarca tanto la colitis ulcerosa (CU) como la enfermedad de Crohn (EC). La CU se define por la inflamación de la mucosa en una distribución continua que se limita al colon. Dependiendo de la extensión, la CU se describe como proctitis, proctosigmoiditis, colitis del lado izquierdo, colitis extensa o pancolitis. La EC, por el contrario, se define por una inflamación transmural en una distribución en parches que puede ocurrir en cualquier parte del tubo digestivo. La EC se caracteriza además por el comportamiento de la enfermedad como no penetrante/no restrictiva, estricta o fistulizante y, además, por tener o no tener afectación perianal. Uno de cada 20 pacientes con EII tiene una presentación superpuesta, conocida como colitis indeterminada.'
          .obs,
      'La patogénesis de la EII es compleja y se cree que es el resultado de una respuesta inmune celular inadecuada a las bacterias luminales. Se han asociado múltiples mutaciones genéticas a un mayor riesgo; por ejemplo, una mutación en NOD2, que codifica una proteína que actúa como sensor intracelular de componentes bacterianos, es responsable de un tercio de los casos de EC. Un desequilibrio entre los linfocitos T auxiliares y los reguladores, junto con una actividad excesiva y persistente de los linfocitos T auxiliares CD4 de tipo 1, también contribuyen al desarrollo de la enfermedad. Por último, se cree que las bacterias comensales de la luz intestinal preparan el sistema inmune y provocan respuestas inflamatorias exageradas dirigidas a otras bacterias luminales disbióticas residentes.'
          .obs,
      playerController.highestLevels[2],
      11,
      'Resuelve correctamente 10 preguntas de bioquímica'.obs),
  Achievement(
      'Enfermedad de Addison'.obs,
      'assets/achievements_images/Addison.png'.obs,
      'En un artículo publicado en 1855, Thomas Addison describió a un grupo de pacientes con un conjunto de síntomas como «languidez y debilidad general, notable debilidad de la acción del corazón y un cambio peculiar de color de la piel» asociados a una enfermedad de las «cápsulas suprarrenales» o, en terminología actual, de las glándulas suprarrenales. La enfermedad de Addison, o insuficiencia corticosuprarrenal crónica, es un trastorno infrecuente causado por una destrucción progresiva de la corteza suprarrenal. En general, las manifestaciones clínicas de la insuficiencia corticosuprarrenal no aparecen hasta que está comprometido al menos el 90% de la corteza suprarrenal.\nAunque puede afectar a cualquier raza y sexo, ciertas causas de enfermedad de Addison (p. ej., suprarrenalitis autoinmunitaria) son mucho más frecuentes en caucásicos y en las mujeres.'
          .obs,
      'La IS primaria crónica se debe con mayor frecuencia a la destrucción autoinmune de la glándula suprarrenal (adrenalitis autoinmune) a través de autoanticuerpos contra la 21-hidroxilasa y la 17-hidroxilasa, enzimas fundamentales en la síntesis de las hormonas esteroideas. En la tuberculosis y las enfermedades fúngicas, la inflamación granulomatosa destruye directamente las células esteroidogénicas. Aunque las glándulas suprarrenales tienen un rico suministro de sangre, la hemorragia y la isquemia también pueden causar una IS primaria. El crecimiento del carcinoma metastásico, comúnmente de los cánceres de mama, pulmón y riñón, puede perturbar la estructura glandular, causando una disfunción endocrina. Pueden producirse insuficiencias glucocorticoidea, mineralocorticoidea y androgénica, pero deben estar afectadas más del 90% de las glándulas para que se manifiesten los síntomas de la enfermedad crónica.'
          .obs,
      playerController.adsSeen,
      10,
      'Mira 10 anuncios para conseguir vidas'.obs),
  /* Achievement(
      'Lupus eritematoso sistémico'.obs,
      'assets/achievements_images/lupus.png'.obs,
      'Esta es una enfermedad muy rara que no sé que más escribir ya que esto solo es un ejemplo'
          .obs,
      (playerController.highestLevels[0].value >= 31).obs,
      'Responde correctamente 30 preguntas de histología'.obs),
  Achievement(
      'Espondilitis anquilosante'.obs,
      'assets/achievements_images/espondilitis_anquilosante.png'.obs,
      'Esta es una enfermedad muy rara que no sé que más escribir ya que esto solo es un ejemplo'
          .obs,
      (playerController.highestLevels[1].value >= 31).obs,
      'Responde correctamente 30 preguntas de fisiología'.obs),
  Achievement(
      'Osteogenesis imperfecta'.obs,
      'assets/achievements_images/osteogenesis_imperfecta.png'.obs,
      'Esta es una enfermedad muy rara que no sé que más escribir ya que esto solo es un ejemplo'
          .obs,
      (playerController.highestLevels[2].value >= 31).obs,
      'Responde correctamente 30 preguntas de bioquímica'.obs),
  Achievement(
      'Osteogenesis imperfecta'.obs,
      'assets/achievements_images/osteogenesis_imperfecta.png'.obs,
      'Esta es una enfermedad muy rara que no sé que más escribir ya que esto solo es un ejemplo'
          .obs,
      (playerController.adsSeen >= 30),
      'Mira 30 anuncios para conseguir vidas'.obs), */
]);
